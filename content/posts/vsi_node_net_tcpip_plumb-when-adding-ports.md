---
author: Roman Tarnavski
categories:
  - technology
date: 2010-06-05 08:50:32
excerpt: A simple solution to being unable to add another interface to a vSwitch due to a SysinfoException.
tags:
  - bad0017
  - esx
  - esxi
  - vmware
  - VSI_NODE_net_tcpip_plumb
  - vsphere
  - vswitch
title: VSI_NODE_net_tcpip_plumb when adding Ports
---

<figure>
  <img src="/images/2010/06/VSI_NODE_net_tcpip_plumb.png">
  <figcaption>Exception when adding a network</figcaption>
</figure>

Adding a new port (i.e. a vMotion interface) to a vSwitch on vSphere/ESX leads to this lovely error message. If you check your `vpxd.log` you'll see something the image verbalised.

```java
[2010-06-04 15:30:52.411 03152 info 'App'] [VpxLRO]; ERROR task-54417; host-36589; vim.host.NetworkSystem.updateNetworkConfig: vim.fault.PlatformConfigFault:
(vim.fault.PlatformConfigFault) {
dynamicType = <unset>,
faultCause = (vmodl.MethodFault) null,  
text = "SysinfoException: Node (VSI_NODE_net_tcpip_plumb) ; Status(bad0017)= Out of resources; Message= Instance(0): Input(4) if=0 portset=VMkernel macaddr=00:50:56:76:16:67 tsomss=65535 ",
msg = "Error during the configuration of the host: SysinfoException: Node (VSI_NODE_net_tcpip_plumb) ; Status(bad0017)= Out of resources; Message= Instance(0): Input(4) if=0 portset=VMkernel macaddr=00:50:56:76:16:67 tsomss=65535 ",
} 
```

Key here is the `Out of resources;` message. The reason for this is none other than the default number of ports for the vSwitch on ESX is 24, and if you have VM's or other interfaces using up ports (such as AppSpeed probes), you will quickly run out. Switch this easily by going to Configuration -> Networking -> Properties [for the vSwitch in question] and up the value up to and including your growth requirements for the future.

![](/images/2010/06/step1_2-1.png)
![](/images/2010/06/step3_4.png)
![](/images/2010/06/step_final.png)

## Note

After you setup a new host, set it to more ports than you require, as you'll need to restart the host for the ports to be provisioned; best to do this immediately after installation. 

I think a better message would be to explicitly say _"Out of available ports on vSwitch - [blah]"_; instead of the semi-cryptic one presented.