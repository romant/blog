---
author: Roman Tarnavski
categories:
  - technology
date: 2010-07-11 04:23:38
dsq_thread_id:
  - ''
excerpt: A look at the structure of an OVA+OVF and how to deploy a vApp on a single host without vCenter.
guid: http://blog.romant.net/?p=477
id: 477
tags:
  - ova
  - ovf
  - vmware
title: Unsupported element 'VirtualSystemCollection' + how to split an OVA
---

A colleague recently stumbled upon this beautiful error when trying to import an OVA to an ESX and ESXi host:

<figure>
  <img src="/images/2010/07/unsupported_element.png">
  <figcaption>Unsupported element 'VirtualSystemCollection'</figcaption>
</figure>

The cause is that the packaged OVA is actually a vApp extract from vCenter, and standalone hosts (not under management of a vCenter) are not able to accomodate vApp.

From [VMware](http://www.vmware.com/products/cloud-os/application.html)

> vApps: Ensuring seamless application movement and choice between clouds

It seems a single host isn't "cloud"-enough. 😉

An OVA that is extracted from vCenter which contains only a single VM is extremely close in its structure to the OVF apart from a tuple called … \*drum roll\* … `<VirtualSystem ovf:id="cake">` in the single, and `<VirtualSystemCollection ovf:id="cake">` in one that encompasses multiple machines. So a hosts ability is limited to not being able to parse this collection of machines and discriminate between their properties, that's why you need to spend $ on vCenter!

This is all great, but my colleague is now stuck half-way around the world with a set of machines that need to be deployed on a single host, and all of them are saved within this OVA.

An OVA is just a wrapper for an OVF (think VMX) and some VMDK's {anyone VM/OVconfused yet?}.

```sh
$ tar tf cake.ova
cake.ovf
cake-disk1.vmdk
cake-disk2.vmdk
cake-disk3.vmdk
cake-disk4.vmdk
cake-disk5.vmdk
cake.mf
```

We can see there's a collection of VMDK's, the manifest which inside looks like this:

```
SHA1(cake.ovf)= 03AD765EC45B90E13BC22D0115088F08021F2AE5
SHA1(cake-disk1.vmdk)= 92BB519FD1926D4F3C170C727C037E2D5D79775B
```

… and more importantly the OVF, which describes the OVA motherload.

My thoughts were at first to just create a VMX for each of the VMDKs and then I can go to bed. Unfortunately one of the machines has two disks, so the first issue is with figuring out how the OVF nests the `rasd` - Resource Allocation Setting Data (as per the [DMTF OVF Specification V1.1](http://www.dmtf.org/standards/published_documents/DSP0243_1.1.0.pdf)).

Thanks to [Mr. Pekka](http://linux.die.net/man/1/xmlindent) for writing `xmlindent` or you could just use the [online](http://xmlindent.com/) version

I was quickly able to see to which VM disks 3+4 belonged to, and create the appropriate VMX skeleton. Now if only there was a parser…