---
categories:
  - technology
date: 2008-08-24 01:28:39
dsq_thread_id:
  - '16198407'
guid: http://www.romant.net/?p=138
id: 138
tags:
  - apple
  - document scanner
  - fujitsu scansnap S510M
  - mac
  - OCR
  - paperless office
  - workplace
title: Paperless office - the story of the S510M
---

Going green? Or going neat? Get rid of that paper!

<figure>
  <img src="/images/2008/08/post-it.jpg">
  <figcaption>Paper stack. Source: flickr{bookgrl}</figcaption>
</figure>

Think of all the bills, invoices, warranty cards, tax refunds and bank statements that you file away, day after day. The problem here is that paper is bulky, and takes up a lot of physical space, especially if you’re an owner of a filing cabinet.

My hope for this task was to achieve a state where I can be light on my feet, so should I require to move places or send off a tax returns, I can now do so within a few minutes and not hours, and perhaps even to save myself a bit of sanity

## Goals

  * quick - no one wants to spend 5 minutes processing each document that comes in the mail
  * searchable - putting in an account number of any kind, should bring up ALL the relevant document. So OCR here is a must
  * manageable and easy - I don’t want to wade through hundred of folders to get the document that I want. Plus should I wish to group a set of files together for a submission, that should also be easily achieved

What will you need:

  * document scanner
  * OCR software
  * some time to plan-out your storage strategy

### Quick

Speed is an important factor when deciding on picking the right document scanner. I looked at several brands, but being an Apple user, am unfortunately limited to a certain domain of equipment with drivers that will work with OSX. I went with a Fujitsu ScanSnap S510M. The ‘M’ n the model denoting ‘Mac’, so naturally the only difference between that and the non-mac version is that its white and comes with apple drivers. Fortunately for me and you, it competes very well against the competition such as Canon DR 2050C

### Searchable

<figure>
  <img src="/images/2008/08/yep-papers-devonthink-comparison.jpg">
  <figcaption>Yep Devon Papers software Comparison</figcaption>
</figure>

The ability to find a scanned document by varying characteristics such as tags and creation dates and not merely by the hierarchy of parent folders, I find quite a necessity. Several applications that I looked at, had each their good points and down-right annoying.

DEVONthink Pro Office apart from the dated interface, lack of tagging ability {think folders}, **$150 dollar price tag** - is quite a lot like Lightroom for your documents. It has a lot of nice features, such as word occurrence calculators, which helps you pick out the most unique descriptions for each document. Devon keeps a database that you must also backup, of all the structure and data that you enter about each of the documents, so not the most agile of concepts.

Yep by Ironic Software is one of the more popular solutions. Thanks in-part to their clean design and ability to tag each document. It too relies on an database {XML-based plist} for the storage of its own meta-data. After spending quite a bit of time with Yep, I very much like the speed and almost ‘freshness’ of the app. Its drawbacks are also its strong points, it doesn’t have an OCR engine, which is great - since it leaves it up to you the user to figure out which one you wish to use. I tried both ABBY, and Acrobat; prefer the latter due to speed, and ability to do some compression with help of AppleScript before spitting out the resulting PDF.

I did notice a few bugs on first use

* by setting the ‘original document created’ field, the date doesn’t get saved to the file itself, and thus isn’t reflected in Finder’s ‘Info’.
* ability to create multiple smart collections of documents with the same name {screenshot below}
* when searching for tag occurrence within documents and you aggregate several tags together, an empty result-set is generated

> I sent the above-mentioned issues to the developers, and I have yet to hear back from them. Will update this section when I get a reply.

Despite the technical flaws, am a big fan of the workflow that Yep presents, yet their testing practices leave much to be desired.

Last but not least, Papers, an application that specializes in the storage and research of scientific papers. I would leave it at that, I didn’t find it useful for the task at hand, that’s not to say it isn’t good at what its designed for.

### Manageable

Although tightly related with the previous section, manageability of your documents is something that will underpin how well you’re able to search for items once you get all those documents into some sort of a repository.

Unfortunately all the applications I’ve looked at, keep their own database of the meta-data. This is unfortunate for two reasons:

  1. **Switching cost** - between applications is increased, as you’re more likely to stay with an app once you’ve imported a copious number of documents and succumbed to the apps way of thinking.
  2. **Backup** - of not only the documents but also the database has to be thought of. This is where Devon makes it easy, by allowing you to place its database file into any location you desire, such as with your documents. What’s worse is that Yep doesn’t give you that freedom, and keeps its library within your Application Support folder. I received an email from ‘Ironic Support’ informs me that the only way to keep documents and data-store in one location, is if you keep all documents in your `Application Support/Yep` folder.

### The Scanner

An important consideration for this whole task is the scanner itself. So what are you looking for in a document scanner? It doesn’t really matter what I say here, as price inevitably dictates peoples choice. Personally I saw the time it takes me to collate, organise, and file my .. err files extremely wasteful. It ended up being about how much my time is worth to me in the long run.

After doing some research the decision was between two models, the Fujitsu S310M and the S510M. The baby {given its diminutive size} of the two, S310M has one of the most attractive features in a document scanner, it can be powered merely off the USB ports on your laptop. So if you travel a lot, and its important to scan research papers {if not available in PDF-form already} or contacts, then you can’t go past the S310M. I chose to go with the S510M hoping that the extra $100 will result in a better quality scanning ‘head’ if I may call it that; so your choice should also depend on how many documents you’re going to be scanning. If you’re merely going to be doing a couple of pages a day, then grab the S310M alternatively if you are swamped with papers on a daily basis, or are going to be re-scanning your complete paper filing cabinet it might be an idea to go for the big brother S510M.

The shots below are to allow you to see comparatively how big or small this document scanner really is. I didn't want to use the metric system, nor the imperial system - to prevent confusion. So I picked a unit everyone is familiar with. So the scanner is about 1.3 iPhones tall, with a footprint of about 1.1 iPhones, with the length of just under 2.3 iPhones.

![](/images/2008/08/Closed_Fujitsu_ScanSnap_S510M_t.jpg)
![](/images/2008/08/SIDE_Fujitsu_ScanSnap_S510M_t.jpg)
![](/images/2008/08/TOP_Fujitsu_ScanSnap_S510M_t.jpg)

Both scanners do duplex scanning, thus double sided documents are not a problem. What impressed me most is how well the paper feeder actually works. I’ve had the experience of working with a Canon DR 2050C and if you mis-align a page, or put something of obscure size, such as a shopping docket through - you were bound to get it jammed, not so with the S510M. I threw about a hundred sheets of A4, A5, dockets, scrunched receipts from the corner PC store, throughout the duration of the day and without a single twitch it generated a double-sided PDF for me; with the help of Acrobat 8.0 Professional and some AppleScript it OCR’ed and knocked out backgrounds for me too. In instances where I was a little eager and mis-aligned the paper, the software automatically corrected any skewing and rotated the page upright - nice!

### Conclusion

When I first embarked on setting myself free from dependence on the myriad of documents, I was very hesitant to lay down the $'s for a scanner. Albeit since it arrived, it has been a blessing. As soon as I scan a document, back it up {on that in the next post}, I shred it. Hence to anyone that values their time, and ability to streamline some of the mundane tasks of paper management I couldn't recommend the idea of a paperless office more.

Have you made your office paperless?