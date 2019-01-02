---
categories:
  - technology
date: 2008-08-25 21:51:28
dsq_thread_id:
  - '16198411'
guid: http://www.romant.net/?p=184
id: 184
tags:
  - apple
  - iphone
title: Empty iPhone Emails - Solved
---

iPhones Firmware update 2.1, seems to have gotten rid of the problem. If now only Apple would fix the damn [calendar bug](http://twitter.com/romant/statuses/918985782)

Have you recently sent an email from your beloved iPhone and have it delivered - empty? Then when you look at the sent on your phone you get the lovely: "This message has no content".

![](/images/2008/08/img-0007.png)

It was simple - the problem was my signature. Which constituted of a simple '•'. An elevated full-stop, also known as bullet-point.

There appears to be a bug in the iPhone that is as follows:

* If you send an email with a • as the LAST character, your sending bar at the bottom of Mail.app will continually say 'Sending', and the email will not even show up in your sent
* If you send an email with words, then • and then some more words - not a problem - it will be delivered

If I didn't know better, I'd say that upon Unicode conversion upon sending, the email becomes corrupt through a rogue parser.

Quite an oversight on Apple's behalf, and has only appeared since the 2.0.2 update.

Moral of the story - don't have a bullet point as the last character in your emails, let alone your signature.

Have you noticed any strangeness in your iPhones behaviour?

•