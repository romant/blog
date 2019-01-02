---
categories:
  - technology
date: 2011-01-05 17:31:08
dsq_thread_id:
  - '203104345'
excerpt: In order to demonstrate to some customers, partners and colleagues that haven't had a chance to enjoy vCloud Director yet, I've recently prepared some videos which demonstrate how you go setup a network within vCD.
format: video
guid: http://blog.romant.net/?p=535
id: 535
tags:
  - nat
  - network
  - vcloud
  - vmware
  - vshield
title: By Example - Networks in vCloud Director
---

In order to demonstrate to some customers, partners and colleagues that haven't had a chance to enjoy vCloud Director yet, I've recently prepared some videos which demonstrate how you setup a network within an Organization on top of vCD. They're designed to be completely self-sufficient, so the 'intro' is re-used.

#### Direct Network

This is by far the most … straight forward way of providing your VM's with an outside connection.

{{< vimeo 18452797 >}}

#### Routed Network

The elegance of vShield Edge allows you to configure DHCP, Firewall, and NAT IP Mapping through an easy to click-through UI. Be it for your Organization or vApp. Here I'll show you how to setup a NAT-Routed vShield backed internal network.

{{< vimeo 18452976 >}}

#### Custom'ish vApp Network

There are environments that have already invested a lot in customizing their own DHCP server rules, Dynamic DNS registrations, reverse lookups, firewalls… the list goes on. In essence, here I can show you how you can re-use your current soft-router, and have it used within the vCloud realm.

{{< vimeo 18453095 >}}