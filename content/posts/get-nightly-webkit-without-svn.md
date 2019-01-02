---
categories:
  - technology
date: 2008-04-13 18:59:22
dsq_thread_id:
  - '16198399'
guid: http://www.romant.net/?p=101
id: 101
tags:
  - bash
  - nightly
  - osx
  - script
  - webkit
title: Get Nightly WebKit without SVN
---

![](/images/2008/04/webkit-icon.png)

[Everyone](http://blogs.computerworld.com/safari_is_about_to_get_crazy_fast) agrees that [WebKit](http://www.webkit.org/) is the faster browser engine. Plus it's my favourite browser/engine in OSX

Problem is that it doesn't update itself automatically - and every night there's a beautiful new build that comes out - which I simply must have.

So in order to save you time - here's a little script that I put together this afternoon that will download the latest build at the push of a button.

Initially I wrote it with wget, but realised not everyone will have it installed - hence here's a version with curl
  
```sh
#!/bin/bash
#  getWebKit.sh - Obtain the latest WebKit build
#
#  Created by Roman Tarnavski on 2008-04-13.
#  For an updated version head to www.romant.net
#
#
#  Distributed under a Creative Commons Attribution 3.0 License
#  For more details on the license: http://creativecommons.org/licenses/by/3.0/
var_dir="/var/tmp/"
echo -n "Downloading WebPage ..."
location="http://nightly.webkit.org"
curl http://nightly.webkit.org/index.html -o ${var_dir}index.html > .get_webkit.log 2>&1
nightly=`cat ${var_dir}index.html | grep ".dmg" | cut -d '"' -f 2 | uniq`
echo "Done"
filename=`echo $nightly | cut -d '/' -f 5`
echo -n "Getting WebKit ..."
curl $location$nightly -o $var_dir$filename >> .get_webkit.log 2>&1
echo "Done"
if [ $? ]; then
	echo -n "Installing WebKit ..."
	rm -rf /Applications/WebKit.app
	hdiutil attach -quiet "$var_dir$filename"
	cp -R /Volumes/WebKit/WebKit.app /Applications/
	hdiutil detach -quiet /Volumes/WebKit
	echo "Done"
	exit 0
fi
#cleanup
if (( $? )); then rm ${var_dir}index.html && rm $var_dir$filename ; fi
```

Let me know how you go

 