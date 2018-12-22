---
author: Roman Tarnavski
categories:
  - technology
comments: true
date: 2011-03-05 20:54:19
dsq_thread_id:
  - '246061897'
excerpt: Lion Disk Encryption more than twice as fast as PGP WDE.
guid: http://blog.romant.net/?p=623
id: 623
permalink: /technology/pgp-wde-vs-lion-disk-encryption/
tags:
  - filevault 2
  - lion
  - mac
  - pgp
title: PGP WDE vs. Lion Disk Encryption
url: /2011/03/05/pgp-wde-vs-lion-disk-encryption/
---

Beyond the veil of security, and sense of calm I get when leaving my laptop in the car or airport lobbies; the next most important thing to me is performance (after all, running my VMware lab on a laptop with a single drive isn't exactly cheap). Thus mid last year I invested in a 240 GB OCZ Vertex 2 SSD drive, to run inside my i7 MBP. Encrypting your drive absolutely kills performance, so I did some very un-scientific tests today upon my upgrade to Lion that I wish to share. Below are several Xbench results for HDD performance only, covering 'fresh' HDD, and encrypted. Within Snow Leopard (10.6) with PGP WDE, and in Lion (10.7) with the inbuilt Disk Encryption.  

![](/images/2011/03/p_fresh.png)

![](/images/2011/03/p_enc.png)

First up as you can see we have the fresh install, and nicely enough, with just an OS upgrade, there's an increase in the disk throughput. More importantly though, is the encrypted performance. Averaging out PGP vs Lion, we witness a doubling of the MB/s capability within the latter. On the one hand, its a shame I have a license for PGP that I spent ~$175AUD, on the other, it served its purpose, and is now going to be replaced by something that comes free with the OS, and performs better. Symantec has a talent for buying dying horses.