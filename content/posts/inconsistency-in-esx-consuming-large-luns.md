---
author: Roman Tarnavski
categories:
  - technology
date: 2010-01-24 14:40:46
dsq_thread_id:
  - '75453278'
excerpt: Instead of consuming the supported part of a presented LUN, ESX will choose the spill-over space instead.
guid: http://www.romant.net/?p=302
id: 302
tags:
  - esx
  - storage
  - vmware
title: Inconsistency in ESX consuming large LUNs
url: /2010/01/24/inconsistency-in-esx-consuming-large-luns/
---

… go with me here. 

You are going to have black caviar (highly recommended). You were provided with 50 grams; you figure you can fit at most 45 grams onto the piece of that delicious dark-rye. So what do you do? Do you disregard and thus throwout the 5 grams? … Well it's not important what YOU would do, its important what VMware does!

Mr. ESX tends to look at the excruciatingly expensive, sustenance-providing caviar, and throws out the majority that it can't handle, and opts for the remains in the hard-to-reach crevices of the jar.

What does this all mean for the geek?

There's a decrepit limit of 2TB minus 512 bytes for each LUN that you can present to ESX. Anything larger, it has no love for. So if you were to present it with a 4TB LUN, you would naïvely assume that you would get the bastardised version of 2TB and the rest would be lost in the ether. I guess that would be somewhat logical.

Lets try it:

<figure>
  <img src="/images/2010/01/capacity_available.jpg">
  <figcaption>Capacity vs. Available Space</figcaption>
</figure>

There you have it. Instead of actually using up as much as ESX'ly possible (~2TB) from a LUN that has been allocated, VMware chose to only pick up the left-overs (~500GB).