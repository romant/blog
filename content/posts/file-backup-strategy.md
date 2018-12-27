---
author: Roman Tarnavski
categories:
  - photography
  - technology
date: 2008-01-15 14:56:04
dsq_thread_id:
  - '16198328'
id: 76
tags:
  - 40D
  - backup
  - raid
  - syncback
title: File Backup Strategy
---

Photos are the most precious material possession anyone owns, and should be the first to be saved in the case of a fire.

So how does one provide the appropriate backup solution to safeguard their cherished memories? My general approach to backing up the photos is by no means simple, yet it does the job.

Just as a disclaimer - the main application that I use is unfortunately Windows only - although a similar setup can be achieved using rsync.

Here goes:

1. Download the images off the camera using Lightroom, which simply stores them in the yyyy-mm-dd format
1. SyncBackSE then automatically mirrors the newly added images onto a separate hard drive in my T60’s expansion slot, for a pseudo RAID-1 solution
1. When I'm at home there are two states for my laptop, either docked or free and about. In either case, my network drives get mounted. Once this occurs, the local SyncBackSE copies the images straight onto my server.
1. The server's two main backup drives are configured in a RAID-1, using Adaptec 1210SA adapter
1. I then have another copy of SyncBackSE installed on the server, which once a week copies all the files from the RAID-1 drive, onto a third drive within the server. This gives me some time to recover shots if I did delete any.
1. Once a month or there about – I also have an external drive which I merely copy manually and then store at a friends house.
1. As mentioned in the previous step, a third drive is given 1 week of lead time prior to being updated. Now in order to solve the geographic problem of having all the backups under the one roof - I have a Site-to-Site VPN with a relative, for whom I purchased a 500GB drive, onto which I then backup once a week.

The great thing about this setup is that as soon as a file is added by me or I modify tags within Lightroom of a photo, the change is automatically replicated across 4 drives - just in case, and overall – each image exists in 8 places.

## Pros
* Quick and automated backup solution
* When I’m travelling – I still utilize the complete backup cycle – by connecting via a VPN directly to the server using my laptop in an internet cafe – and provided they have enough UP bandwidth – I’m done uploading in 20-30 minutes, and my server then takes care of everything.

## Cons
* This occurs within a one physical domain (provided my laptop is at home at the time) - so should a fire occur, the complete setup is futile - as everything is burnt.
* There's a finite amount of space available on my laptop, and although it wasn't a problem when I shot JPEG with the 300D, now with the ease of RAW processing within Lightroom and ability to shoot it easily with my 40D - one days outing ends up being about 1-2 GB.

Solution to the first problem is in the next step of my backup workflow, and to the second problem I’ll cover in a later post.

In order to help distinguish between my drives, I have a naming scheme for them. I grab the names out of Greek mythology, sometimes even attempting to match the name to the task of the drive.

Here's a diagram of a solution that works for me

<figure>
  <img src="/images/2008/01/backup-strategy.jpg">
  <figcaption>Backup Strategy</figcaption>
</figure>

If anyone finds this useful/too-much – am interested to hear your opinions. Feel free to share how you do it – and any suggestions you may have.
