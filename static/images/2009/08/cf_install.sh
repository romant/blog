#!/bin/bash
# cf_install.sh - CLI Wizard for WebSphere Portal CumulativeFix Installs
#
# Created by Roman Tarnavski on 2009-06-13.
# For an updated version head to www.romant.net
#
#
# Distributed under a Creative Commons Attribution 3.0 License
# For more details on the license: http://creativecommons.org/licenses/by/3.0/

#********  MUST CUSTOMIZE PATHS FOR OWN ENVIRONMENT   **********

export WS_ROOT="/opt/WebSphere"
export WAS_PATH="$WS_ROOT/AppServer"
export WPS_PATH="$WS_ROOT/PortalServer"
export PROFILE_PATH=$WS_ROOT/wp_profile
export CFG_ENGINE=${PROFILE_PATH}/ConfigEngine/ConfigEngine.sh

export FTP_CMD="curl -s -u USERNAME:password "
export FTP_ADD="ftp://YourFTP/Release/Java/$RELEASE_MAJOR/6.1.0.x/"

export SRC_URL="http://lp/wpinstall"
export PUI_URL="$SRC_URL/wps/PUI/6.1/PortalUpdateInstaller.tar.gz"

#***************************************************************

export RELEASE_MAJOR=6.1
export RELEASE_MINOR=`cat $WPS_PATH/wps.properties | grep version | cut -f 2 -d=`

export PK_NAME="UNKNOWN"
export TMP_DIR="/opt/zips"

function check_PK_installed ()
{
	PK_list_installed | grep -q $1 &> /dev/null
}

function PK_download ()
{
	echo -n "Downloading $1 ... "
	$FTP_CMD ${1} -O $TMP_DIR &> ~/wcm_cf.log
	echo "Done"
		
	echo -n "Unzipping $TMP_DIR/$PK_ZIP_NAME ... "
	unzip -o $TMP_DIR/$PK_ZIP_NAME &> ~/wcm_cf.log
	echo "Done"
}

function PK_install ()
{
	echo -n "Installing CF [$1] ... "
	$TMP_DIR/updatePortal.sh -installDir $WPS_PATH -fix -install -fixDir $TMP_DIR -fixJars $1.jar &> ~/wcm_cf.log
	
	check_PK_installed ${PK_NAME}
	
	if [[ $? == 1 ]]; then
		echo "Fixpack $1 could not be installed, try again"
		exit 1
	fi
	
	export CF_INSTALL_ATTEMPTED=yes
	echo "Done"
}

function PK_uninstall ()
{
	echo -n "Uninstalling CF [$1] ... "
	$TMP_DIR/updatePortal.sh -installDir $WPS_PATH -fix -uninstall -fixDir $TMP_DIR -fixes $1 &> ~/wcm_cf.log
	
	check_PK_installed ${PK_NAME}
	
	if [[ $? == 0 ]]; then
		echo "Fixpack $1 could not be uninstalled, try again"
		exit 1
	fi
	
	echo "Done"
}

function PK_list_installed ()
{	
	for efix in `ls -1 $WPS_PATH/version/*.efix`
	do
		file=`basename $efix | cut -f 1 -d.`
		description=`cat $efix | grep short-description | awk -F\" '{print $2}'`
		buildversion=`cat $efix | grep build-version | awk -F\" '{print $2}'`
		echo "$file : $description | $buildversion"
	done
}

function setup_env ()
{
	if [[ ! -d "$TMP_DIR" ]]; then
		mkdir -p $TMP_DIR
	fi
	cd $TMP_DIR
	
	if [[ ! -e ./updatePortal.sh ]]; then
		echo -n "Detected that the PUI is missing, Grabbing it ... "
		wget -q $PUI_URL
		if [[ $? != 0]]; then
			echo "Failed"
			echo "Unable to download PUI from: "
			exit 1
		fi
		tar xzf PortalUpdateInstaller.tar.gz
		rm -rf !$
		mv PortalUpdateInstaller/* . ; rm PortalUpdateInstaller
		
		echo "Done"
	fi
	. $PROFILE_PATH/bin/setupCmdLine.sh
	killall java -9 &> ~/wcm_cf.log
}

function ftp_list ()
{
	$FTP_CMD -l $FTP_ADD
}

function PK_ftp_find ()
{
	if [[ -n $CF_PICKED ]]; then
		clear
		echo "Your installed release: $RELEASE_MINOR"
	fi
	PS3="Your pick: "
	select choice in `ftp_list`
	do
		case choice in
			*)
			FTP_ADD="${FTP_ADD}${choice}/"
			export CF_PICKED=yes
			PK_ftp_find
			FTP_ADD=`echo $FTP_ADD | sed -e "s/\/$//"`
			PK_ZIP_NAME=`basename $FTP_ADD`
			PK_NAME=`echo $PK_ZIP_NAME | awk -F- '{print $3}' | sed -e "s/\.zip//"`
			RELEASE_MINOR=`echo $PK_ZIP_NAME | awk -F- '{print $1}'`
			if [[ -	n $CF_INSTALL_ATTEMPTED ]]; then
				break
			fi
			
			PK_download $FTP_ADD
			PK_install ${PK_NAME}_${RELEASE_MINOR}
			
			break
			;;
		esac
	done
}

clear
setup_env

echo "-----Currently Installed iFixes-----"
PK_list_installed
echo "------------------------------------"

echo -e "\n\n1. Install\n2. Uninstall"
read resp

if [[ $resp = 1 ]]; then
	PK_ftp_find
	
elif [[ $resp = 2 ]]; then
	
	PS3="Uninstall {PK}: "
	QUIT="Exit"
	touch "$QUIT"
	IFS=$'\n'
	select choice in `PK_list_installed`
	do
		unset IFS
			
		case choice in
			*)
				PK_NAME=`echo $choice | aw</li>
k '{print $1}'`
				PK_uninstall $PK_NAME
				
				break
				;;
		esac
	done
else
	exit 1
fi

echo -n "Starting Portal ... "; service portal start &> ~/wcm_cf.log && echo "Done"
echo -n "Updating Portal ... "; $CFG_ENGINE update-wcm &> ~/wcm_cf.log && echo "Done"
echo -n "Restarting Portal ... "; service portal restart &> ~/wcm_cf.log && echo "Done"

echo -e "\n\nHopefully Everything Worked."

exit 0

</code>
