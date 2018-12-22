---
author: Roman Tarnavski
categories:
  - reflection
date: 2011-06-13 16:12:18
dsq_thread_id:
  - '330212577'
excerpt: Service providers have a long way to go before they can use Cloud to aid an enterprise to scale.
guid: http://blog.romant.net/?p=655
id: 655
permalink: /reflection/why-enterprises-arent-ready-for-cloud/
tags:
  - cloud
  - enterprise
title: Why Enterprises aren't ready for Cloud
url: /2011/06/13/why-enterprises-arent-ready-for-cloud/
---

According to IDC, the mere growth of virtual private cloud services by 2014, will be in excess of 230% from a base of 2010, or be worth $46USD billion as an industry. This referring to the homogeneous, logical environment that will span public + private and be isolated for an organisation. Of the current public cloud providers supporting this, how many can actually take your existing environment and extend it into their own to allow you to use their capacity as needed?

<figure>
  <img src="/images/2011/06/growth_cisco_idc_smo_2010.png">
  <figcaption>Source: IDC 2010 SMO Analysis | repurposed</figcaption>
</figure>

It is important to note that within a discussion on cloud, several attributes are always considered: trust, availability, flexibility, inevitably - cost; but most importantly the vital tenant, scale.

Arguably most of these are actually better catered for within the cloud-sphere. You have complete stateful, and migratory capability of a security policy which can reflect business rules and be as dynamic as required. Technologies like VMware's HA, and FT can provide guarantees around operational state of the OS, integration with Intel's TXT can further provide assurances around [GRC](http://en.wikipedia.org/wiki/Governance,_risk_management,_and_compliance) and around execution on foreign tin; thus introducing capability the original OS + App need-not design and maintain. Lastly, through significant consolidation and utilization adjustment, an organisation can drive significant cost savings to a pure hardware-OS-app stack. How do we then grow this environment?

The problem of scale within an enterprise is normally solved vertically with mainframes, and horizontally with oft-too-expensive clustered approach. What happens to all your old apps that are mission critical? How do you 'cloudify' them? Typical [response](https://twitter.com/samj/status/79885807808294912) is re-architect. Reality is that the lifecycle of a typical enterprise-grade application is around 15-20 years (or considerably more if you look at Sabre). Thus any suggested changes to these monoliths will undoubtedly not be greeted with open arms by the application and business owners.
  
Therefore re-architecture is simply not an option. We have designed an elegant abstraction for each of these silos, called Virtual Machines. Which transform the old and senile into something more malleable and agile, or so you would think.

At the end of the day, we've just injected some functionality into the sarcophagus of an ever-decaying technological silo. Now we have to figure out a way to move it around. How do we optimize this further? How do we migrate these workloads and expand the stacks' capability? Surely there are service providers out there that can help?!

There do exist "cloud-providers" that can cater for, and ingest your applications to be run within their own DC's. Whether you're moving to or from their premises, they will support you; in a very manual fashion. Herein lies the issue, under the guise of 'cloud'; they're no more than a hosting service provider with a brand new brochure.

In order for a provider to be truly cloud-enabled, and allow for Enterprises to scale outside their physical boundary. They must support the same abstraction-architecture as you use internally, and federate your application and data in a seamless and live manner, thus delivering on 'true-cloud' promise, and not the same way that you have always attacked this by replication without state.

Technically, the problem of migrating live workloads across distances has been solved. We encapsulate the OS+App within a VM, all networks and their configuration for a group of VM’s that is further packed within a vApp; is provided through vShield. Inter-DC communication can be achieved with Cisco’s OVT or stretched L2 networks (ugh), thus giving us the mobility of the state. Lastly, the moving of the storage can be facilitated through with VPLEX by further abstracting the underlying storage arrays to achieve the fully virtualized, completely federated, live workload migration. 

> The unfortunate state of affairs is that whilst we continue to have the baggage of old-school applications, for a solution to be Enterprise-ready, **it must provide for 'warts and all' encapsulation and transmission**. Until that is the case, and organisations as well as the service providers standardise on a mechanism and technological cocktail, we can't really be calling some clouds, clouds.