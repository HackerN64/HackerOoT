# The Legend of Zelda: Ocarina of Time

```diff
- WARNING! -

The ROM this repository builds cannot be 'shifted', primarily due to some hardcoded pointers which have yet
to be dumped. Thus this repository is currently in an experimental and research phase and cannot yet be used
traditionally as a source code base for general changes.
```

This is a WIP decompilation of The Legend of Zelda: Ocarina of Time.
The purpose of the project is to recreate a source code base for the game from scratch, using information found inside the game along with static and/or dynamic analysis.
The only build currently supported is Master Quest (Debug), but other versions are planned to be supported.

It builds the following ROM:

* zelda_ocarina_mq_dbg.z64 `md5: f0b7f35375f9cc8ca1b2d59d78e35405`

**Note:** This repository does not include any of the assets necessary to build the ROM.
A prior copy of the game is required to extract the needed assets.

Website: <https://zelda64.dev/>

Discord: <https://discord.zelda64.dev>

## Installation

### Windows

For Windows 10, install WSL and a distribution by following this
[Windows Subsystem for Linux Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
We recommend using Debian or Ubuntu 18.04 Linux distributions.

For older versions of Windows, install a Linux VM or refer to either [Docker](#Docker) or [Cygwin](#Cygwin) instructions.

### Cygwin

If you want to use Cygwin, you will need to:
- Download and install [Git Bash](https://git-scm.com/download/win).
- Download and install [Cygwin](https://cygwin.com).
- [Build and install mips-linux-binutils](docs/BUILDING_BINUTILS_CYGWIN.md).

Once mips-linux-binutils is installed you will need to install the following packages using Cygwin's installer:
- python3
- libiconv
- dos2unix

Now before you try to build anything, if you cloned the repository in windows you will need fix the file line endings:
```bash
dos2unix fixle.sh
./fixle.sh
```

### macOS

For macOS, use homebrew to install the following dependencies:
* coreutils
* make
* python3
```bash
brew update
brew install coreutils make python3 md5sha1sum
```

You'll also need to [build and install mips-linux-binutils](docs/BUILDING_BINUTILS_MACOS.md).

Going forward in this guide, please use `gmake` whenever you encounter a `make` command.
The `make` that comes with MacOS behaves differently than GNU make and is incompatible with this project.
You should now be able to continue onto step 3.

### Linux (Native or under WSL / VM)

#### 1. Install build dependencies

The build process has the following package requirements:

* git
* build-essential
* binutils-mips-linux-gnu
* python3

Under Debian / Ubuntu (which we recommend using), you can install them with the following commands:

```bash
sudo apt-get update
sudo apt-get install git build-essential binutils-mips-linux-gnu python3
```

#### 2. Download and set up qemu-irix (optional)

Note: We are currently testing a recompiled version of the compiler that does not require qemu-irix.
This step allows you to build with qemu-irix and the original compiler by adding `ORIG_COMPILER=1` to the `make` command in step 6, for example if you experience issues with the recompiled version.

Download qemu-irix from the Releases section in the repository. Place it at a location of your choosing.

Open up your .bashrc file (~/.bashrc), scroll to the bottom, and add the following, replacing the paths as necessary:

```text
export QEMU_IRIX="path/to/your/qemu-irix"
```

Save and close/reopen your terminal window.

#### 3. Clone the repository

Clone `https://github.com/zeldaret/oot.git` where you wish to have the project, with a command such as:

```bash
git clone https://github.com/zeldaret/oot.git
```

#### 4. Prepare a base ROM

Copy over your copy of the Master Quest (Debug) ROM inside the root of this new project directory.
Rename the file to "baserom_original.z64", "baserom_original.n64" or "baserom_original.v64", depending on the original extension.

#### 5. Setup the ROM and build process

Setup and extract everything from your ROM with the following command:

```bash
make setup
```

This will generate a new ROM called "baserom.z64" that will have the overdump removed and the header patched.
It will also extract the individual assets from the ROM.

#### 6. Build the ROM

Run make to build the ROM.
Make sure your path to the project is not too long, otherwise this process may error.

```bash
make
```

If all goes well, a new ROM called "zelda_ocarina_mq_debug.z64" should be built and the following text should be printed:

```bash
zelda_ocarina_mq_dbg.z64: OK
```

If you instead see the following:

```bash
zelda_ocarina_mq_dbg.z64: FAILED
md5sum: WARNING: 1 computed checksum did NOT match
```

This means that the built ROM isn't the same as the base one, so something went wrong or some part of the code doesn't match.

### Docker

#### 1. Setup requirements

To use Docker, you'll need either Docker Desktop or Docker Toolbox installed and setup based on your system.

You'll also need to prepare a local version of the project with a copied base ROM (see Step 4 and 5 of the Linux instructions).

#### 2. Create the docker image

From inside your local project, run the following command:

```bash
docker build . -t oot
```

#### 3. Start the container

To start the container, you can mount your local filesystem into the docker container and run an interactive bash session.

```bash
docker run -it --rm --mount type=bind,source="$(pwd)",destination=/oot oot /bin/bash
```

#### 4. Setup and Build the ROM

Once inside the container, you can follow Step 6 and 7 of the Linux instructions to setup and build the ROM, or run any other command you need.

## Contributing

All contributions are welcome. This is a group effort, and even small contributions can make a difference.
Some tasks also don't require much knowledge to get started.

Most discussions happen on our [Discord Server](https://discord.zelda64.dev), where you are welcome to ask if you need help getting started, or if you have any questions regarding this project and other decompilation projects.
