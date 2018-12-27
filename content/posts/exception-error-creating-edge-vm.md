---
author: Roman Tarnavski
categories:
  - technology
date: 2011-01-06 11:20:35
dsq_thread_id:
  - '203662266'
excerpt: Upon trying to create a Routed network within vCD, you can be faced with a "Error creating Edge VM" message. If you look within the debug logs, the stack-trace will look something like
guid: http://blog.romant.net/?p=561
id: 561
tags:
  - network
  - vcd
  - vds
  - vmware
  - vshield
title: 'Exception: Error creating Edge VM'
---

Upon trying to create a NAT-Routed network within vCD, you can be faced with a 

> "Error creating Edge VM"

If you look within the debug logs, the excerpt of the stack-trace will look something like this:
  
```java
com.vmware.ssdc.util.LMException: Error creating Shield network appliance.
...
at java.lang.Thread.run(Thread.java:619)
Caused by: com.vmware.ssdc.util.LMException: Error creating Edge VM.
... 17 more
Caused by: java.lang.NullPointerException
...
``` 

<figure>
  <img src="/images/2011/01/Error-creating-Edge-VM.png">
</figure>

The cause is a misconfigured ESX Host that is sitting in the same resource pool as others connected to the dVS against which vCD is trying to create the network group.

Solution being to either remove the host, or alternatively verify that all hosts are connected EQUALLY to the dVS. This is where Host Profiles come in very handy.

I apologise for the lack of a vCD screenshot, I fixed the problem before realising that it was one; at least there will always be logs. Once you do see this again, feel free to send in a screenie.

**Related Local Files** - `logs/vcloud-container-debug.log`