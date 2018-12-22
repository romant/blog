---
author: Roman Tarnavski
categories:
  - technology
date: 2010-05-09 18:21:45
dsq_thread_id:
  - ''
excerpt: Where to find and how to slipstream just the video drivers from VMware Tools into Windows.
guid: http://blog.romant.net/?p=380
id: 380
permalink: /technology/slipstream-vmware-video-drivers-into-windows/
tags:
  - driver
  - nlite
  - slipstream
  - streaming
  - video
  - vmware
  - vmx_svga.sys
title: Slipstream VMware Video Drivers into Windows
url: /2010/05/09/slipstream-vmware-video-drivers-into-windows/
---

Am currently working on automating WebSphere Portal install on Windows. I do not want Windows restarting the first time it comes up, whether its for installing VMware Tools, or any of its drivers. 

What I require is to add the VMware Video drivers to the base Windows installation. This will work for XP/Windows 2003. You can easily integrate the drivers once you've found them with the use of nLite. The trick is in finding them.

First thing you'll need is the [VMware Tools ISO](http://blog.romant.net/vmware/where-to-find-http://blog.romant.net/vmware-tools-on-the-esx-host/) that we discovered a couple posts back. 

<figure>
  <img src="/images/2010/05/exploded_iso.png">
  <figcaption>Exploded VMware Tools ISO</figcaption>
</figure>

**NOTE**: I rename `VMware Tools[64].msi` to `vtools[64].msi`

The next step is to extract the `vtools64.msi` which you can accomplish with:
  
```
msiexec /a vtools64.msi /qb TARGETDIR=c:\driver\
```

<figure>
  <img src="/images/2010/05/Screen-shot-2010-05-09-at-5.50.52-PM.png">
  <figcaption>Extracting VMware Tools</figcaption>
</figure>

After a few seconds, you're done. By navigating to the Common64\VMware\Drivers\Video folder, you will find the vmx\_svga.inf that you need for nLite as well as the vmx\_svga.sys which is the driver. When it comes to nLite - just point it to the directory.

## VMware video directory listing

```
vmwogl32.dll	  
vmwogl64.dll	  
vmx_fb.dll	  
vmx_mode.dll	  
vmx_svga.cat	  
vmx_svga.inf	  
vmx_svga.sys
```