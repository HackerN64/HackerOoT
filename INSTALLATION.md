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
[WSL Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install).
We recommend using Ubuntu 20.04 as the Linux distribution.

For older versions of Windows, install a Linux VM or refer to [Docker](docs/BUILDING_DOCKER.md) instructions.


### Linux (Native or under WSL / VM)

#### 1. Install build dependencies

The build process has the following package requirements:

* git
* build-essential
* binutils-mips-linux-gnu
* curl
* python3
* python3-pip
* python3-venv
* libpng-dev
* libxml2-dev
* gcc-mips-linux-gnu

Note: you can use another GCC as long as it target MIPS.

Under Debian / Ubuntu (which we recommend using), you can install them with the following commands:

```bash
sudo apt-get update
sudo apt-get install git build-essential binutils-mips-linux-gnu curl python3 python3-pip python3-venv libpng-dev libxml2-dev gcc-mips-linux-gnu
```

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

Place a copy of the Master Quest (Debug) ROM inside the `baseroms/ntsc-1.2/` folder.

Rename the file to `baserom.z64`, `baserom.n64` or `baserom.v64`, depending on the original extension.

**NOTE:** to make a Wii VC build you will need to place a copy of the Ocarina of Time.wad file in this folder too, with the ``common-key.bin`` file. This project won't provide both.

#### 4. Setup the ROM and build process

Setup and extract everything from your ROM with the following command:

```bash
make setup
```

This downloads some dependencies (from pip), and compiles tools for the build process.
Then it generates a new ROM "baseroms/ntsc-1.2/baserom-decompressed.z64" that will have the overdump removed and the header patched.
It will also extract the individual assets from the ROM. This command will also setup F3DEX3 binaries.

**NOTE:** the decompressed baserom will be copied to ``baseroms/gc-eu-mq-dbg/``, this is a temporary solution.

#### 5. Build the ROM

Run make to build the ROM.
Make sure your path to the project is not too long, otherwise this process may error.

```bash
make
```

If all goes well, a new ROM should be built at `build/ntsc-1.2/oot-ntsc-1.2.z64`.

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