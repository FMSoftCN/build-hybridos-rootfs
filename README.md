# Building HybridOS rootfs

This repo contains some scripts to fetch and build HybridOS rootfs

This instruction assumes that you are using Ubuntu Linux 18.04/20.04 LTS.

- [Building HybridOS rootfs](#building-hybridos-rootfs)
   + [Prerequisites](#prerequisites)
   + [Building steps](#building-steps)
   + [Options for build script](#options-for-build-script)
- [Copying](#copying)

## Current Status

Currently, the latest official release of MiniGUI is version 5.0.6.

Main enhancements of MiniGUI Core and its components are as follow:

## Building MiniGUI

### Prerequisites

You should run `apt install <package_name>` to install the following packages
on your Ubuntu Linux.

* Building tools:
   * git
   * gcc/g++
   * binutils
   * autoconf/automake
   * libtool
   * make
   * cmake
   * pkg-config

You can run the following commands to install all above software packages on Ubuntu 18.04/20.04:

```
$ sudo apt install git g++ binutils autoconf automake libtool make cmake pkg-config
```

### Building steps

1. list all HybrodOS defconfigs 

```
$ make list-defconfigs | grep hybridos

  hybridos_defconfig                  - Build for hybridos
  hybridos_lite_defconfig             - Build for hybridos_lite
  r818_hybridos_defconfig             - Build for r818_hybridos
  r818_hybridos_lite_defconfig        - Build for r818_hybridos_lite
```

1. select defconfigs 

```
$ make hybridos_defconfig
```

1. Run `make` to build 

```
$ make
```

1. wait while it compiles

1. find the rootfs.tar in output/images

### Options for build script

You can modify the build options through the `make menuconfig` command before running the `make` command.

```
$ make menuconfig
```

1. `Target options` : target architecture

1. `Toolchain` : toolchain (gcc, glibc and so on)

1. `Target packages` : the packages you wish to compile


## Copying

Copyright (C) 2018 \~ 2020 [Beijing FMSoft Technologies Co., Ltd.]

- For device side and client side, HybridOS uses GPLv3 or LGPLv3.
- For server side, HybridOS uses AGPLv3.
- For documents, GPLv3 applies.

If a component of HybridOS is a derivative of an existing
open source software, we generally continue to use the original license.

Also note that HybridOS integrates many mature open source software,
such as ZLib, LibPNG, LibJPEG, SQLite, FreeType, HarfBuzz, and so on.
For the copyright owners and licenses for these software, please refer to
the README or LICENSE files contained in the source tarballs.
