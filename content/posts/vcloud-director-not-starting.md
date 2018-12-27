---
author: Roman Tarnavski
categories:
  - technology
date: 2010-12-21 14:26:23
dsq_thread_id:
  - '194874346'
excerpt: 'The ''Could not bind network port'' issue fixed when starting vCloud Director '
guid: http://blog.romant.net/?p=529
id: 529
tags:
  - vcd
  - vcloud
  - vmware
title: vCloud Director Not Starting
---

Attempted to bring up vCD and saw the following in `vcloud-container-debug.log`

```java
| ERROR | Start Level Event Dispatcher | StartupUtils | Error starting application: Could not bind network port: 80 on host address: 172.16.225.131 |
java.net.BindException: Cannot assign requested address
at java.net.PlainSocketImpl.socketBind(Native Method)
at java.net.PlainSocketImpl.bind(PlainSocketImpl.java:365)
...
```

One of these days I'll allocate some static IP's to my whole Fusion-bound vLab. Until then - I will put up with DHCP assigned IP's.

To fix, first stop vCD with `vmware-vcd stop`, then modify `cloud-director/etc/global.properties` to reflect the IP changes for:

```
vcloud.cell.ip.primary  
consoleproxy.host.https
vcloud.cell.ips 
```

.. or anywhere you have the old address[es]. Some love from `sed` will do the trick here