---
categories:
  - technology
date: 2010-05-08 20:39:04
dsq_thread_id:
  - '207670185'
excerpt: ESX 4 kickstart and considerations for booting from SAN
guid: http://blog.romant.net/?p=368
id: 368
tags:
  - boot
  - kickstart
  - san
  - vmware
title: ESX 4.x kickstart and booting from SAN
---

Kickstarts are wonderful. Simple and effective. The ability to automate the mundane installations for *nix all about. In my case, I need to automate the installation of hosts that will be booting from SAN.

We have an admin that once installed a couple of ESX hosts atop other host's boot LUNs. It's pointless blaming the admin, as there's a basic rule that must be followed at all times that will prevent this from happening.

**Note** - Don't let the host see boot LUNs for any other host than itself.

<figure>
  <img src="/images/2010/05/Untitled.png">
  <figcaption>ESX Dedicated Boot LUNs</figcaption>
</figure>

This can be accomplished with:

  * LUN Masking (on the host HBA)
  * SAN Zoning (on your fabric)
  * Port Grouping (on your storage)

Horror story aside, lets have a look at a basic kickstart for the ESX. When you install ESX by hand, it creates a `ks.cfg` file in root's home. Inside you will find the host configuration at the time of install.

> ASSUMPTION: You have already provisioned the necessary space on your array for your host, and have mapped the host access to that LUN. 

After a few modifications and some cleanup, I ended up with the following
  
```sh
accepteula
keyboard us
auth  --enablemd5 --enableshadow
#this will work on all 'fresh' LUNs. If you want to an
#existing vmfs store, then add --overwritevmfs
clearpart --firstdisk
install cdrom
rootpw --iscrypted $1$MoIxblff$td1t5Oe4Kq8KZqyByh5Bc1
timezone --utc 'Australia/Sydney'
network --addvmportgroup=true --device=vmnic0 --bootproto=dhcp
part '/boot'  --fstype=ext3 --size=1100  --onfirstdisk
part 'none'  --fstype=vmkcore --size=110  --onfirstdisk
part 'HOSTNAME_boot'  --fstype=vmfs3 --size=9232 --grow  --onfirstdisk
virtualdisk 'esxconsole' --size=8232 --onvmfs='HOSTNAME_boot'
part 'swap'  --fstype=swap --size=1228 --onvirtualdisk='esxconsole'
part '/var/log'  --fstype=ext3 --size=2000 --onvirtualdisk='esxconsole'
part '/'  --fstype=ext3 --size=5000 --grow --onvirtualdisk='esxconsole'
%post --interpreter=bash
# ntp settings
esxcfg-firewall --enableService ntpClient
chkconfig ntpd on
cat > /etc/ntp.conf <<EOF
# ---- ntp.conf ----
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery

#replace with your ntp server address
server x.x.x.x

hostname HOSTNAME
sed -i -e "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

EOF
```

I set out to install onto the FIRST available drive. In my case, thats always LUN 0, and if by some accident there's already a VMFS on it - installation will cease (you can accomplish a force through by adding `--overwritevmf` to the `clearpart` line.

<figure>
  <img src="/images/2010/05/Screen-shot-2010-05-08-at-8.14.24-PM.png">
  <figcaption>ESX Kickstart Installation</figcaption>
</figure>

Once the setup completes you will be greeted with a "Press \<enter> to reboot" - in a normal RedHat install you can get around this by adding `reboot --eject` just before the `%post` statement. Unfortunately this doesn't seem to work for ESX. I'll update the post once I find a way.

You may notice that I keep referring to `HOSTNAME` - that's because the `ks.cfg` is part of another script which puts together a custom ISO for each of our blades.