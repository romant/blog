---
categories:
  - technology
date: 2010-05-31 12:44:54
dsq_thread_id:
  - ''
excerpt: Making a bootable ISO with mkisofs for Linux, Solaris and Windows
guid: http://blog.romant.net/?p=392
id: 392
tags:
  - linux
  - mkisofs
  - solaris
  - windows
title: 'Creating bootable ISO : Linux, Solaris, Windows'
---

Whenever you're automating OS deployments, you will at one point require to build a custom ISO, with your own kickstart, jumpstart or an OEM folder with apps and instructions to boot.

Here are three `mkisofs` commands that you can use for each OS, and to ease your search a little.

> You will require to be in the `root` of each ISO directory
Remember the lone period "." at end of each statement

## Linux

```sh
mkisofs -q -V VOLUME_NAME -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -T -o /LinuxISO.iso .<br />
```

## Solaris
  
```sh
mkisofs -b boot/grub/stage2_eltorito -c .catalog -no-emul-boot -boot-load-size 4 -boot-info-table -relaxed-filenames -l -ldots -r -N -d -D -V VOLUME_NAME -o /SolarisISO.iso .<br />
``` 

## Windows

The `Bootable_NoEmulation.img` normally lives in the [BOOT] folder. I tend to move it.

```sh
mkisofs -q -b Bootable_NoEmulation.img -no-emul-boot -boot-load-seg 1984 -boot-load-size 4 -iso-level 2 -J -joliet-long -l -D -relaxed-filenames -N -V VOLUME_NAME -o /WindowsISO.iso .<br />
```