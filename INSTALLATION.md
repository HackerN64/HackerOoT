# Installation

We recommend using WSL on Windows, or native Linux, which the rest of this readme describes. We currently have instructions for

* [Windows](#Windows), with and without WSL
* [macOS](docs/BUILDING_MACOS.md)
* [Linux](#Linux-Native-or-under-WSL--VM), natively or using WSL / VM
* [Docker](docs/BUILDING_DOCKER.md)

(These will also depend on the Linux instructions.)
Some of these may also be out of date or unmaintained; usually our contributors use WSL, Linux, and macOS, so these instructions should be up to date.

### Compiler

The compiler to use is automatically detected by the build system. We recommend using [Modern SDK](https://crashoveride95.github.io/modernsdk/startoff.html).

### Windows

For Windows 10 or 11, install WSL and a distribution by following this
[WSL Installation Guide](https://learn.microsoft.com/en-us/windows/wsl/install).
We recommend using Ubuntu as the Linux distribution.

For older versions of Windows, install a Linux VM or refer to [Docker](docs/BUILDING_DOCKER.md) instructions.


### Linux (Native or under WSL / VM)

#### 1. Install build dependencies

The build process has the following package requirements:

* git
* build-essential
* curl
* python3
* python3-pip
* python3-venv
* libxml2-dev

Python 3.10+ is required.

Under Debian / Ubuntu (which we recommend using), you can install them with the following commands:

```bash
sudo apt-get update
sudo apt-get install git build-essential curl python3 python3-pip python3-venv libxml2-dev
```

In addition to these packages, a MIPS binutils installation is required if you're not using ModernSDK. The project aims to support a couple of commonly-encountered MIPS toolchains out-of-the-box, only one is required and is automatically detected:

* mips64-ultra-elf- or mips64- from the [practicerom toolchain](https://github.com/PracticeROM/packages)
* mips64-elf- from the [libdragon n64 homebrew library](https://github.com/DragonMinded/libdragon/releases/tag/toolchain-continuous-prerelease)
* mips-linux-gnu- or mips64-linux-gnu- found in common distribution package managers as e.g. `binutils-mips-linux-gnu`

If none of these are available to install, the makefile exposes `MIPS_BINUTILS_PREFIX` as a means to set your own toolchain prefix. Otherwise, consider building one of the first two options from source.

If you are using GCC as the compiler for Ocarina of Time, you will also need the corresponding gcc compiler for the chosen toolchain. For the first two options above, gcc is included automatically. For mips-linux-gnu- or mips64-linux-gnu- it is often a separate package, e.g. `gcc-mips-linux-gnu`.

#### 2. Clone the repository

**N.B.** If using WSL, we strongly encourage you to clone into WSL's Linux filesystem using Linux's `git`.
Cloning into the Windows filesystem will result in much slower read/write speeds, and often causes issues when Windows copies the files with the wrong line endings, which the compiler IDO cannot handle correctly.

Clone `https://github.com/HackerN64/HackerOoT.git` where you wish to have the project, with a command such as:

```bash
git clone https://github.com/HackerN64/HackerOoT.git
```

This will copy the GitHub repository contents into a new folder in the current directory called `HackerOoT`. Change into this directory before doing anything else:

```bash
cd HackerOoT
```

#### 3. Prepare a base ROM

First, pick the version of the game you want to build.
The supported versions and ROM checksums can be found in the table above.
As an example, the `ntsc-1.2` version will be used in these instructions.

Place a copy of the ROM inside the `baseroms/<the-version>/` folder for your version of choice.
For example for `ntsc-1.2`, inside the `baseroms/ntsc-1.2/` folder.
If you are under WSL, you can run the command `explorer.exe .` to open the current directory in the Windows file explorer.

Rename the file to `baserom.z64`, `baserom.n64` or `baserom.v64`, depending on the original extension.

**NOTE:** to make a Wii VC build you will need to place a copy of the Ocarina of Time.wad file in this folder too, with the ``common-key.bin`` file. This project won't provide both.

#### 4. Setup the ROM and build process

Setup and extract everything from your ROM with the following command:

```bash
make setup VERSION=<the-version>
```

For example for `ntsc-1.2`, run `make setup VERSION=ntsc-1.2`.

This downloads some dependencies (from pip), and compiles tools for the build process.
Then it generates a new ROM `baseroms/<the-version>/baserom-decompressed.z64`.
For retail (non-debug) versions, that ROM will be the decompressed equivalent of the ROM.
For the `gc-eu-mq-dbg` version, that ROM will have the overdump removed and the header patched.
The other debug ROMs `gc-eu-dbg-2` and `gc-eu-dbg` will also have the overdump removed.
It will also extract the individual assets from the ROM.

#### 5. Build the ROM

Run make to build the ROM.
Make sure your path to the project is not too long, otherwise this process may error.

```bash
make VERSION=<the-version>
```

For example for `ntsc-1.2`, run `make VERSION=ntsc-1.2`

If all goes well, a new ROM should be built at `build/<the-version>/hackeroot-<the-version>.z64` (for example `build/ntsc-1.2/hackeroot-ntsc-1.2.z64`), and the following text printed:

```
==== Build Options ====
OoT Version: <the-version>
MIPS Toolchain: <detected toolchain>
MIPS ABI: <ABI option>
Code Version: <commit hash>
Debug Build: <1 for debug builds otherwise 0>
Opt. Flags: <optimization flags>
Rom Path: build/<the-version>/hackeroot-<the-version>.z64
Build Author: <build author>
Commit Author: <commit author>
Build succeeded.
```

**NOTE:** to speed up the build, you can either:

* pass `-jN` to `make setup` and `make`, where N is the number of threads to use in the build. The generally-accepted wisdom is to use the number of virtual cores your computer has.
* pass `-j` to `make setup` and `make`, to use as many threads as possible, but beware that this can use too much memory on lower-end systems.

Both of these have the disadvantage that the ordering of the terminal output is scrambled, so for debugging it is best to stick to one thread (i.e. not pass `-j` or `-jN`).

#### 6. Other targets

##### Compressing the rom
To compress the rom, run the following command:

```bash
make compress
```

##### Building for Wii VC
To build a .wad for Wii VC, run the following command:

```bash
make wad
```

**NOTE:** this is assuming you followed the instructions for Wii VC in [step 3](#3-prepare-a-base-rom).

##### Creating a BPS patch
To generate a .bps patch you can run the following command:

```bash
make patch
```

The patch will be in the ``build/ntsc-1.2/`` folder.

#### 7. Toggle HackerOoT Features

You can customize which HackerOoT features you want in your project and which not in the `include/config/` folder.
Just define the features as `true` or `false` or, if necessary, put in the value you want (e.g. Text speed).

**TIP:** if you are using VS Code, look at [vscode.md](docs/vscode.md) for useful customization that make working with this project easier.

## Changing build options

By default, if you don't specify a version to build with `VERSION=<the-version>` in the make commands, the `ntsc-1.2` version is used.
This default can be changed in the Makefile.

The project Makefile is fairly configurable and can also be used to prepare the repo for modding.
See the options outlined at the top of the Makefile for more information.
