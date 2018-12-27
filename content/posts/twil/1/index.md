---
title: "This Week I Learnt - 1"
date: 2018-12-26T22:05:09+11:00
draft : true
tags: 
  - tag
---

{{% chart id="heart" width="800" height="500" data="heart.csv" %}}

According to the blog's first post - I started in 2007. Vast majority of the published ( and those died in draft form ) were a result of trying to fix things I came upon and learnings; be it automating WebSphere deployment 😜, or a GPS logger's integration with Lightroom.

For a few years now, I have remained mum, and only seldomly post to Twitter, and perhaps once / twice per year to FB.

Time for a shakeup.

Here are a few things I learnt this week.

## Wordpress Migration 
I killed my WordPress hosting sometime in early '18, and just archived the content. Upon a number of conversations early on with [@Grant](https://twitter.com/grantorchard) - I contemplated a conversion to Jekyll. But did not have the drive at the time to make the leap.

Ended up moving the WP archive to Jekyll, which sat there for about 6 months, and a few days ago over lunch I had a quick perusal of static generators and the associated ecosystem trajectories. Picked Hugo.

**The Good**

- Hugo is ⚡️ FAST
- Hugo's Go Templating Language - reminds me of Handlebars

**The ~~Broken~~ Still In Limbo**

- Should have really got the SEO sorted out first prior to jumping
- Figuring out when to stop.. do I really need to write a custom Hugo shortcode to display Apple Watch HR data ?

## Netlify
- Few companies I come across, and after even cursory view I keep digging. [Netlify](https://netlify.com) has some notable pedigree from Github, Docker, Serverless but most importantly looking at the UX of their product highlights to me how well they've thought through the landscape of customer demands, competitors' ability and are now navigating it all.

## tmux

Ugh. After an intense week of pure Kubernetes work, it was starting to be a pain to easily monitor deployments, state of hosts, and trying to script several scale and failover scenarios. Constant Terminal.app switching was inevitable. Jetisoning my love of `screen` it was time to adjust.

// insert screenshot of tmux & k8s

<!-- ## Kubernetes Material
Went through Kelsey's [Kubernetes The Hard Way]( https://github.com/kelseyhightower/kubernetes-the-hard-way) again, and also through LFS258. No matter  -->

## Visualising Apple Health Data

After quite a quite poor run with [James](https://twitter.com/james65535), I decided to see how I went on the trusty phone, since Apple ⌚ tracks all movement. Quickly realising this is an opportunity for a post-dinner mini project.

The team at [Test-Driven Data Analysis](http://www.tdda.info/in-defence-of-xml-exporting-and-analysing-apple-health-data) does an excellent job of showing how you can get the data off the watch, but most importantly convert it from XML to something more usable.

Once you have the CSV, the fun begins.

Listing your `apple_health_export` at this point should present you with :

```c
1.3G export.xml
385M export_cda.xml
318M ActiveEnergyBurned.csv
189M BasalEnergyBurned.csv
140M DistanceWalkingRunning.csv
89M HeartRate.csv
72M StepCount.csv
17M AppleExerciseTime.csv
7.9M DistanceCycling.csv
4.1M FlightsClimbed.csv
397K HeartRateVariabilitySDNN.csv
79K SwimmingStrokeCount.csv
77K DistanceSwimming.csv
63K RestingHeartRate.csv
62K WalkingHeartRateAverage.csv
12K VO2Max.csv
5.3K convert.py
971B BodyMass.csv
940B UVExposure.csv
497B Height.csv
```

For the purpose of generating the headline graphic with [ChartJS](https://www.chartjs.org/) all you need to do :

Create a new Hugo Layout Shortcode

```sh
mkdir -p layouts/shortcodes
```

Charts themselves are quite straight forward, but you'll need to map the data first through

In their native form they sit as..

```csv
sourceName,sourceVersion,device,type,unit,creationDate,startDate,endDate,value
"Roman's Apple Watch",,"<<HKDevice: 0x2812d08c0>, name:Roman's Apple Watch, manufacturer:Apple, model:Watch1,2, localIdentifier:com.apple.health.some_long_identifier_string>","HeartRate","count/min",2015-05-22 13:05:21 +1100,2015-05-22 13:03:49 +1100,2015-05-22 13:03:49 +1100,81
"Roman's Apple Watch",,"<<HKDevice: 0x2812d0cd0>, name:Roman's Apple Watch, manufacturer:Apple, model:Watch1,2, localIdentifier:com.apple.health.some_long_identifier_string>","HeartRate","count/min",2015-05-22 13:43:56 +1100,2015-05-22 13:43:49 +1100,2015-05-22 13:43:49 +1100,65
```
..yea - not pretty, and that's only two points.

some `cut` magic and cleanup recommended, as naturally it does have your Watch's identifier included. I have just left the `endDate` and `value`.

From here you'll need to map it to distinct `dataPoints` and `labels` Arrays for injestion by the `ChartJS` library.

```js
data = $.csv.toObjects(response);
labels = _.map(data, 'endDate');
dataPoints = _.map(data, 'value');
```

Add [chart.html](https://gist.github.com/romant/e7262a5b9e2f3b9e2bc0ac8c46a1282e)