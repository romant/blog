---
author: Roman Tarnavski
categories:
  - technology
date: 2009-08-23 17:10:17
dsq_thread_id:
  - '75453404'
excerpt: A vSphere Client error Unexpected end of file has occurred. The following elements are not closed.
id: 259
tags:
  - chartsettings
  - vmware
  - vsphere client
title: vSphere Client - Unexpected end of file has occurred
url: /2009/08/23/vsphere-client-unexpected-end-of-file-has-occurred/
---

In the unfortunate scenario that the machine you use to run your vSphere client ever crashes (unfortunately VMware doesn't make an OSX Client), you may wish to start up the client, and click the performance tab. You may be greeted with the following when selecting the "Performance" tab:

<figure>
  <img src="/images/2009/08/vSphereClient_Unexpected.png">
  <figcaption>Unexpected end of file has occurred. The following elements are not closed</figcaption>
</figure>

This is due to a file which hosts all the chart settings (an XML-based key value pair collection) becomes corrupt, and is actually cut off.

Its quite easily found at : `c:\Documents and Settings\user_name\Application Data\VMware\server_name-charts.xml`

From here, you have several choices:

  * revert to a backup
  * delete it
  * clear it (just place `<ChartSettings />` inside of it)

That's all there is to it. Happy vSphere'ing