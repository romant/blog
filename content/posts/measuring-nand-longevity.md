---
author: Roman Tarnavski
date: 2012-03-03 10:13:11
dsq_thread_id:
  - '639204668'
guid: http://blog.romant.net/?p=1001
tags:
  - nand
  - ssd
  - storage
title: Measuring NAND Longevity
categories : 
- technology
---

No secret that NAND/Flash/SSD drives are fundamentally different to their spinning cousins. Yet given the relative lack of high-visibility maturity of NAND technologies within the enterprise, adoption of standards has yet to proliferate. Specifically around the determination of failure rate.

When we start looking at availability of mechanical drives or most components inside a server, we first refer to the MTBF.

<figure>
  <img style="background-color: silver; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" src="/images/2012/03/6e8c6ffd43a244835fb4c9b6a58d10c2.png">
  <figcaption>• My helpful screenshot</figcaption>
</figure>

The consumer-grade disks are generally rated at several thousand hours, whereas enterprise-grade drives typically see 1.3million+ hours of operation.

> Due to the differences between spinning and SSD disk, it isn't always appropriate to use MTBF as a measurement of the drives availability.

The NAND memory cell within the SSD doesn't act in the same fashion as a spinning-disk block-abstraction. It must first be erased, prior to a write being carried out; unlike the spinning medium where a simple overwrite is possible.

The bits within a NAND cell are registered by electrons moving through a membrane/tunnel-oxide. It is responsible for keeping those electrons in check.

![Program / Erase Cycle](/images/2012/03/floating-oxide.png)

Gradually, over many program/erase operations the oxide starts to wear out. It is this event that should be avoided, as it will slowly start to cause single-bit errors, and cell locations that expect a 0 will be met with a friendly 1.

For this reason, the Flash Transformation Layer, responsible for all the internals of NAND management & carries out wear-leveling operations which evenly spread the load across hopefully all NAND cells.

Whilst looking at SSDs, there are SLC, MLC, and recently eMLC based flash memory. Difference being the amount of bits that are stored in the individual NAND cells. SLC has a single, whilst MLC/eMLC store two bits. In a lot of cases they're actually exactly the same physical die, and what separates SLC from MLC/eMLC is the aforementioned FTL, amount of reserved space for the load balancing, and capability of the onboard ECC. This results in tunnel oxide in an SLC-rated drive having a typical life of around 100,000 program/erase cycles and 10,000 for MLC.

Now that you can see, that -most- of the wear on the drive occurs during cells actually being written to, and not idle time, given lack of moving components. With nothing changing, the larger the drive coupled with better FLT, the longer the drive will endure.

![](/images/2012/03/endurance-size.png)

The reality check comes in the form of manufacturing processes, and as AnandTech points out, with the reduction in die size, results in extra sensitivity required to read each bit - there's an inevitable hit in individual endurance of the cells. Yet the performance has been clearly increasing with each generation of die-size reduction, which is a result of the gain achieved in the controller power and thus any ECC coupled with greater reserved capacity on the disk has a net effect of - higher performance, and _total_ better longevity.

## NAND Endurance

Instead of looking at a mechanical, time-driven metric, the best way to calculate endurance of the drive is stress the oxide tunnel, and see how many times it can be trespassed, which translates to the amount of bits that can be written.

A standard that only several manufacturers have started to adopt is the JESD218 which gives an Endurance Rating in Terabytes Written (TBW). It also nicely classes client vs enterprise workloads where something as simple as the Power on state is measured (among others… see references).

### Client

  * 40ºC
  * 8hrs/day

### Enterprise

  * 55ºC
  * 24hrs/day

> based on a use scenario in which the SSDs are actively used for some period of time during which the SSDs are written to their endurance ratings

Most importantly the standard is not using just time as a function by which to measure, but the actual endurance level. Therefore when you see a 20PB "TBW Enterprise" rating on a drive, you can quickly determine that the endurance of the drive over a 5 year period offers an ability to write 11 Terabytes per day [20\*1024/(5\*365)].

Next time you're picking a drive, be weary of the correct metric being used to show you how long the unit will actually last. Knowing that each application is different, with its own workload profile - you will be able to easily figure out how long the said drive will last.

## References

1. [SSD is Not the Best Way To Use Flash Memory in Storage](http://storagecommunity.org/blogs/stephenfoskett/archive/2011/11/22/ssd-is-not-the-best-way-to-use-flash-memory-in-storage.aspx)
  
1. [Micron's ClearNAND: 25nm + ECC, Combats Increasing Error Rates](http://www.anandtech.com/show/4043/micron-announces-clearnand-25nm-with-ecc)
  
1. [Solid-State Drive (SSD) Requirements and Endurance Test Method](www.jedec.org/sites/default/files/docs/JESD218.pdf)
  
1. [SSDs heaven or hell? The pros and cons of using NAND flash memory](https://tech.ebu.ch/docs/techreview/trev_2011-Q3_ssd_poijes.pdf)