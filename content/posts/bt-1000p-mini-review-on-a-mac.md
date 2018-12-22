---
author: Roman Tarnavski
categories:
  - technology
date: 2008-06-12 14:36:53
dsq_thread_id:
  - '16198401'
guid: http://www.romant.net/?p=104
id: 104
tags:
  - BT-1000P
  - bt747
  - GlobalSat DG-10
  - mac
  - osx
  - SONY GPS-CS1
  - Wintec WBT-100
title: BT-1000P mini-review on a mac
url: /2008/06/12/bt-1000p-mini-review-on-a-mac/
---

Am soon going away on a little trip, over to Europe, through Tokyo. Wishing to record my trip, as well as have some data for geocoding the photos, I went on a quest to find a GPS unit that allowed me to:

* log data to internal memory
* make sure there's LOTS of memory
* and lots of battery

<figure>
  <img src="/images/2008/06/bt-1000p-4.jpg">
</figure>

After looking at the Sony GPS-CS1, Wintec WBT-100 and GlobalSat DG-100, I concluded that the BT-1000P is by far the best unit for my needs.

* First of all, the GPS chip supports up to 51-channels, with sensitivity down to -158dBm, which allows me to get a satellite lock even at the university concrete monstrosity of a car-park.
* It has integrated bluetooth, so I can use it as a replacement for my ageing Holux-236.
* Most importantly, it can log around 200,000 points, with my current configuration of strings, only 122,398 (@5 second intervals, that's 7 days of 24 hour logging before I have to clear it!)

What pushed me to purchasing after looking at the specifications though is the battery.

* The same as you find in most Nokia phones [BL-5C], which can be picked up cheaply off eBay
* Delivers a claimed 32 hrs of logging, although I was able to get 26 hours without any problems, before the little red battery starts to flash. Mind you - I didn't fully charge it, and just started running it soon after receiving it in the post.

Now I needed the unit to work on a mac, which the BT-1000P doesn't do out of the box. The good news is that there's a project called [bt747](http://bt747.wiki.sourceforge.net/) that lets you interact with the BT-1000P.

![](/images/2008/06/bt-1000p-3.jpg)
![](/images/2008/06/bt-1000p-5.jpg)
![](/images/2008/06/bt-1000p-2.jpg)

Upon connecting the unit via USB the rest of the steps are quite simple:

1. Download and install the USB->Serial [driver](http://www.silabs.com/tgwWebApp/public/web_content/products/Microcontrollers/USB/en/mcu_vcp.htm)
2. Download [bt747](http://bt747.wiki.sourceforge.net/)
3. Switch the BT-1000P to 'LOG' mode
4. Copy `RXTXcomm.jar` and `librxtxSerial.jnilib` into `/Library/Java/Extensions`
5. Run `run_rxtx.sh`

You should get an extremely ugly GUI

![](/images/2008/06/bt747.jpg)
![](/images/2008/06/bt747_connected.jpg)

Just hit 'Connect Port Nbr' and you're ready to go. You should get something similar to: After this, all you have to do, is run around the block a few times with your unit in LOG mode. Come back home, run the app again then: Under the 'File' tab, set the Output directory to a location that has world write access, then hit 'Apply & Set the above values' Alternatively create a directory in your `/var` and `sudo chmod 777 <directory>`.

1. Now -> 'Log' tab
2. Hit 'Get Log' button {this might take a while, depending on how long your jog was}
3. After its complete, feel free to select the output format, either CSV, GPX or KML.

![](/images/2008/06/bt747_getting_log.jpg)
  
If you chose to export a KML, and you have Google Earth installed, you should get a nice looking track. Unfortunately it is evident that the BT-1000P doesn't filter its points prior to writing them out, resulting in data that isn't representative being recorded, hence you can observe the spike.


<figure>
  <img src="/images/2008/06/picture-3.jpg">
  <figcaption>BT-1000P Google Earth</figcaption>
</figure>

Now to get ready for my last exam tomorrow morning, and then to start packing for the trip. Once I'm back, will report on how the unit goes in the field, and I'll include some geocoded images.

### UPDATE

![](/images/2008/06/bt-1000p.jpg)

Upon the comment below by Benn, I remembered a feature that this unit has, that every time you take a photo on your camera - you can also hit the big red button on the tom of the unit. This marks the POI in the data stream. Merely allows you to come back for any manual intervention and find interesting parts easier.