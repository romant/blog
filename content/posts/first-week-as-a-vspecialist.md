---
date: 2010-08-20 22:01:40
dsq_thread_id:
  - '131617270'
excerpt: The timing couldn't have been better. My first three days on the job, I spent in Vblock training with personnel across the VCE alliance.
id: 502
tags:
  - vspecialist
  - workplace
title: First week as a vSpecialist
---

#### Vblock Training

The timing couldn't have been better. My first three days on the job, I spent in Vblock training with personnel across the VCE alliance. My background not being in networking, and having heard great things about those with CCIE certs, it was a pleasure to witness these guys in action.

<figure>
  <img src="/images/2010/08/bike.png">
  <figcaption>•</figcaption>
</figure>

#### Cisco UCS

The first time I saw one was at vForum 2009 in Sydney, an ugly piece of semi-gray/teal enclosure with several blades packed to the rafters full of RAM. Dismissed it immediately because it seemed like an immature solution for a company that didn't have the pedigree of building servers.
  
On my second day of training we started an overview of the chassis, fabrics, blades themselves… something clicked (no, not just [kool-aid](http://twitter.com/romant/status/21410459242)). Problem is, when procuring hardware and you have a choice of vendor, you decide on the 'immediate bang for buck', hence inevitably look at Memory + CPU configuration before all else, without giving much consideration to something just as important if not more, 'ease of management' and deployment 'at scale'. Thus is the racking + stacking of a single blade in a single chassis as simple as doing it across 40 chassis and 320 blades?

There are some stunning features within UCS Manager for scalability. Most notably service profiles, which capture things like SAN+LAN connectivity as well as BIOS+Firmware levels into a quasi-template. Simply put, you can define a policy filter for a certain workload that is to be performed by the blade, and UCS Manager will tell you which blades comply in Memory, Connectivity, CPU and IO-Cards and which can be easily configured to the profile with the push of a button. Some great videos which distill some of the configuration + management benefits are [here](http://www.youtube.com/watch?v=amLXLWn2qOQ).

After those initial three days in training on EMC Storage such as CLARiiON + Symmetrix families, UCS and VMware to see how it all fits within the Vblock offering, I only had two days in the office. In that time I attempted to digest the email firehose of Vblock configurations, customer requests and explanations. My manager promptly and kindly offered my services to help break down some vSphere 4.1 features around core-mapping. As any new starter, then had to spend time on setting up phones, VPNs, cards and travel - have you heard about this VMworld thing? 🤞

> • adapted from flickr user [striatic](http://www.flickr.com/photos/striatic)