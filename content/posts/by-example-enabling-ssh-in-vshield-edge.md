---
author: Roman Tarnavski
categories:
  - technology
date: 2011-01-07 21:54:10
dsq_thread_id:
  - '204585246'
excerpt: By default, no inbound SSH capability exists. In the video I show you how you can enable it
format: video
guid: http://blog.romant.net/?p=581
id: 581
permalink: /technology/by-example-enabling-ssh-in-vshield-edge/
tags:
  - vshield
title: 'By Example: Enabling SSH in vShield Edge'
url: /2011/01/07/by-example-enabling-ssh-in-vshield-edge/
---

I wanted to learn more about how vShield Edge + Manager appliance works under the covers. By default, no inbound SSH capability exists. In the video I show you how you can enable it, so that you can extract the innards of the appliance, and hack away to create something beautiful.

Initially started writing this as a static blog-post, unfortunately too many screenshots + and explanations would be required. Hence I simply recorded some of the steps.

[Enabling SSH in vShield Edge](http://vimeo.com/18527859)

# Caveats

  * There is no possibility that this is in any way supported by our VMware friends, please don't raise SR's on a vSE that you've Roman'ed up!
  * In the last step, I replace the `root` user password. Be sure to restore it from the backup immediately upon ssh'ing back in. As vCloud Director uses that password to interact with vSE, and will be unable to do so.