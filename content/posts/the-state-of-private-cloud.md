---
categories:
  - reflection
date: 2010-06-25 07:16:25
dsq_thread_id:
  - '111076779'
excerpt: A look at the components that underpin successful private cloud delivery.
guid: http://blog.romant.net/?p=419
id: 419
tags:
  - cloud
  - management
  - vmware
title: The state of private cloud
---

<figure>
  <img src="/images/2010/06/cloud-complexity.jpg">
  <figcaption>•</figcaption>
</figure>

When you look at the mostly fragmented cloud and ancillary services market, who do you pick?

Amazon, the incumbent in providing no-frills, pay as you go raw crunch-power has carved out the niche over the last few years with its EC2 offering which has been very popular with corporates dipping their toes in the cloud space. Due to the non-exhaustive list of governance, privacy, flexibility, compliance and classification - organisations are finding it difficult to dive completely in, thus the 'private cloud' model is cast.

In order to partake in the race to the bottom within cost of IT operations and service agility so well presented by the cloud pundits, organisations (the more intelligent ones at least) started to re-think internal infrastructure. The simple question was posed - "how do we make what we have now - _better_ ?". First step with any problem worth solving is to break it down into its elementary components: as such organisations by their very nature will have numerous divisions, departments, sub-organisations and overhead associated with managing not only the division of these business entities, but mainly their computational dependence - this stuff is COMPLEX!

… or is it?

With what Amazon has achieved within the IaaS and Salesforce in S/PaaS in the recent years is a testament to the fact that true multi-tenanted solutions that can scale and be at face value simple to interact-with and build-atop are possible. The only problem is that to date, no one has managed to do this effectively within the confines of an enterprise.

In a recent <a href="http://vpivot.com/2010/06/24/private-clouds-people-consolidation-and-chargeback/" target="_blank">article</a> Scott Drummonds talks about the necessity in transparency of costs associated with spending between various Lines of Business in the organisation. I wish to see that taken further, and not only must transparency exist in consumption, but also in design and most importantly management of the core infrastructure and the systems that uphold the business.

From Citrix, VMware, Microsoft, Oracle or RedHat - there is still not a single public offering which allows you to manage, automate, delegate and provision datacenter technologies on the fly. The best means to competitively differentiate private cloud vendors will not be done in the hypervisor, but within the middleware. You can wheel as many CloudBursts (am looking at you IBM) or Vblocks (VCE) into an the datacenter and try and call it "cloud", but when it comes to true agility with the various datacenters something is missing.

In comes Nimbula, the love child between two former EC2 executives and a development team in South Africa. The aim of the unreleased product is to "combines the flexibility, scalability and operational efficiencies of the public cloud with the control, security and trust of today’s most advanced data centers" - sounds great! The Nimbula Director is slated for general availability in Q4 2010. What is most interesting is that one of the investors is … \*drum roll please\* - VMware. They haven't even started, and already have an exit. Wow.

According to <a href="http://searchcloudcomputing.techtarget.com/news/article/0,289142,sid201_gci1513441,00.html" target="_blank">TechTarget</a>, VMware themselves are coming out with a Service Director product, which aims to do exactly what Nimbula just announced.

<p style="direction: ltr;">
  Given Nimbula's pedigree they will be going with the Xen hypervisor, and building their management suite on top. Coupled with the fact that VMware is now one of the main stakeholders provides us with some assurance of compatibility and hopefully a solution that is truly hypervisor agnostic.
</p>

<p style="direction: ltr;">
  Let the management games begin!
</p>

> • adapted from flickr users [maisonbisson](http://www.flickr.com/photos/maisonbisson) | [dominik99](http://www.flickr.com/photos/dominik99) | [zeno77](http://www.flickr.com/photos/zeno77)