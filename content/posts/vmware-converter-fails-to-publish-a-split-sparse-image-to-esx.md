---
categories:
  - technology
date: 2009-04-20 14:38:05
dsq_thread_id:
  - '75453331'
excerpt: "Converting a VMWare image results in 'FAILED: The object or item referred to could not be found'. Included are the steps that will enable the conversion to complete successfully."
guid: http://www.romant.net/?p=205
tags:
  - esx
  - vmware
title: VMWare Converter fails to publish a split-sparse image to ESX
---

```
"FAILED: The object or item referred to could not be found"
```
.. is the extremely helpful message that VMWare converter displays when it fails.

![](/images/2009/04/vmware-conversion-status.jpg)

Digging deeper, within the logs we can see that there are multiple instances of

```sh
"Warning: failed to create directory"
```
and
```sh
"Warning: failed to clone directory tree".
```

The simple work-around is to convert the vmdk disk to a monolithic-sparse.

You can do this by issuing:

`$ vmware-vdiskmanager -r original.vmdk -t 0 destination.vmdk`

This will clone the disk image as well as modify it from being composed of 2GB files for the entirety of your VM to a single vmdk referred to as a 'monolithic-sparse' (merely referring to the fact that it will increase in size automatically to encompass the the VM partition).

After completing the cloning process, you should have no problems in restarting the conversion process, and it should complete as advertised.