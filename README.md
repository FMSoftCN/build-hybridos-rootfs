# Building HybridOS rootfs

**目录**

- [概述](#概述)
- [目录结构](#目录结构)
- [构建](#构建)
   + [系统要求](#系统要求)
   + [构建步骤](#构建步骤)
   + [修改构建选项](#修改构建选项)
- [版权声明](#版权声明)
   + [Special Statement](#special-statement)


## 概述

本仓库包含了用于构建 HybridOS rootfs 的相关脚本，其主要部分是基于 [Buildroot](https://www.buildroot.org/) 实现的。

建议使用最新的 Linux 长期支持版本，例如 Ubuntu Linux LTS 18.04 or 20.04 来进行构建。

## 目录结构

```
build-hybridos-rootfs/
├── arch
├── board
├── boot
├── configs
├── dl
├── docs
├── fs
├── linux
├── output
├── package
├── support
├── system
├── toolchain
└── utils
```

如上图所示，显示了仓库中的主要目录，它们是：

- `arch/` ：存放CPU架构相关的配置脚本，如arm/mips/x86；
- `board/` ：存放了一些开发板的配置补丁之类的；
- `boot/` ：引导系统；
- `configs/` ：针对不同硬件平台的特有配置文件合集；
- `dl/` ： 存放下载的源代码及应用软件的压缩包；
- `docs/` ：存放相关的参考文档；
- `fs/` ：放各种文件系统的构建脚本；
- `linux/` ：存放着Linux kernel的自动构建脚本；
- `output/` ：编译出来的输出文件夹；
- `package/` ：下面放着应用软件的配置文件；
- `support/` ：一些公共基础设施(kconfig code, libtool patches, download helpers, 等等)；
- `system/` ：根文件系统框架；
- `toolchain/` ：工具链相关配置；
- `utils/` ： 主要脚本的存储目录；


`output` 目录是编译输出文件夹，它的结构如下:

```
output
├── build
├── host
├── images
├── staging -> host/aarch64-buildroot-linux-gnu/sysroot
└── target
```

如上图所示，显示了 `output` 目录的内容，它们是:

- `build/` ： 存放解压后的各种软件包，软件包都在该目录下进行编译；
- `host/` ： 是由各类源码编译后在主机上运行的工具的目录，编译出来的主机工具在host/usr下，根目录所需要的库及一些基本目录就在host/xxx/sysroot；
- `images/` ： 最终生成的rootfs就存放在该目录；
- `staging/` ： 软链接到host/xxxx/sysroot/ 就是上面说到的文件系统需要的库及一些基本目录；
- `target/` ： 目录是用来制作rootfs的，里面放着Linux系统基本的目录结构，以及各种编译好的应用库和bin可执行文件

## 构建 

### 系统要求

我们假设您使用的是 Ubuntu Linux 18.04/20.04 LTS。

在 Ubuntu Linux 中，使用 `apt install <package_name>` 命令安装下面的软件包：

* git
* gcc/g++
* binutils
* autoconf/automake
* libtool
* make
* cmake
* pkg-config

```
$ sudo apt install git g++ binutils autoconf automake libtool make cmake pkg-config
```

### 构建步骤

* 列出配置文件

```
$ make list-defconfigs

  hybridos_defconfig                  - Build for hybridos
  hybridos_lite_defconfig             - Build for hybridos_lite
  r818_hybridos_defconfig             - Build for r818_hybridos
  r818_hybridos_lite_defconfig        - Build for r818_hybridos_lite
```

如上所示，当前内置了四个配置文件，它们是:

- `hybridos_defconfig` ：默认编译 HybridOS 的配置
- `hybridos_lite_defconfig` ：默认编译 HybridOS Lite 的配置
- `r818_hybridos_defconfig` ：为全志 r818 编译 HybridOS 的配置
- `r818_hybridos_lite_defconfig` ：为全志 r818 编译 HybridOS Lite 的配置


* 选择配置文件

直接使用 `make` + 配置文件名 即可完成配置文件的选择

```
$ make hybridos_defconfig
```

* 启动编译，并等待编译完成

```
$ make
```
*  编译完成后，可以在 output/images 找到 `rootfs.tar`

### 修改构建选项

在选择配置文件之后，启动编译之前，可以通过命令 `make menuconfig` 来修改编译选项，如下:

```
$ make menuconfig
```

* `Target options` : 修改目标平台内容，比如CPU类型，浮点数处理等等，如下图所示：
![Target option 菜单](doc/img/menuconfig.png)

* `Toolchain` : 修改工具链相关选项，比如 gcc, glibc 等
* `Target packages` : 修改要编译的软件包


## 版权声明

Copyright (C) 2021 Beijing FMSoft Technologies Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

### Special Statement

The above open source or free software license does
not apply to any entity in the Exception List published by
Beijing FMSoft Technologies Co., Ltd.

If you are or the entity you represent is listed in the Exception List,
the above open source or free software license does not apply to you
or the entity you represent. Regardless of the purpose, you should not
use the software in any way whatsoever, including but not limited to
downloading, viewing, copying, distributing, compiling, and running.
If you have already downloaded it, you MUST destroy all of its copies.

The Exception List is published by FMSoft and may be updated
from time to time. For more information, please see
<https://www.fmsoft.cn/exception-list>.

Also note that the copyright of the resource assets included in the
demos might be reserved by the copyright owner. For more information,
please see the README files in the sub directories.
