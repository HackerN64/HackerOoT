# Hacker Zelda: Ocarina of Time (HackerOoT)

[![Contributors][contributors-badge]][contributors]

[contributors]: https://github.com/HackerN64/HackerOoT/graphs/contributors
[contributors-badge]: https://img.shields.io/github/contributors/HackerN64/HackerOoT

This project, based on the [Zelda: Ocarina of Time decompilation project](https://github.com/zeldaret/oot/), aims to be an easy-to-use base to make Zelda: Ocarina of Time mods. **It is not producing a PC port.**

The only build currently supported is Master Quest (Debug), but other versions are planned to be supported.

It builds the following ROM:

* hackeroot-mq.z64

This project is using the following tools:
- [F3DEX3](https://github.com/HackerN64/F3DEX3), *will make you want to finally ditch HLE*, by Sauraen
- [gzinject](https://github.com/krimtonz/gzinject), *injector for gz*, by krimtonz
- [z64compress](https://github.com/z64tools/z64compress), *the fastest Zelda 64 rom compressor*, by z64tools
- [Flips](https://github.com/Alcaro/Flips), *patcher for IPS and BPS files*, by Alcaro

**Note: This repository does not include any of the assets necessary to build the ROM. A prior copy of the game is required to extract the needed assets.**

## HackerN64

**Discord:** <https://discord.gg/brETAakcXr>

## Zelda: Ocarina of Time Decompilation

**Website:** <https://zelda64.dev>

**Discord:** <https://discord.zelda64.dev>

## Getting Started

### Installation

Instructions to build this project are available [here](INSTALLATION.md).

### Modding

HackerOoT features are listed in the config headers under ``include/config/``.

This project includes an example scene, available if ``INCLUDE_EXAMPLE_SCENE`` is set to ``true``. It's accessible from the file select.

This also includes an example cutscene, playable in the example scene when holding ``L`` + ``R`` and pressing ``A``.

## Debugging with GDB

Using [the Ares emulator](https://github.com/ares-emulator/ares) you can debug the code using GDB.

The only thing you need to change is the decomp path inside [``tools/gdb_load_ovl.py``](tools/gdb_load_ovl.py):
- Linux: set the ``decomp_path`` at the top of file to your decomp path like a normal Linux path
- Windows (WSL): set this path to ``Z:`` with the Linux path (for instance: ``Z:/home/user/path/to/HackerOoT/``)

Note: the path needs to end by a ``/``, if you don't have a filesystem drive already setup to access WSL you can follow [this guide](https://github.com/Dragorn421/z64-romhack-tutorials/blob/master/debugging/gdb/windows_mount_wsl_network_drive.md) to do it. If for some reasons you can't use ``Z:`` you will need to update [``.vscode/launch.json``](.vscode/launch.json) and [``tools/gdb_load_ovl.py``](tools/gdb_load_ovl.py)

Next, you need to install ``gdb-multiarch``:
- Linux: you can just run ``sudo apt-get update && sudo apt-get install gdb-multiarch``
- Windows (WSL): install [MSYS2](https://www.msys2.org) then open a MSYS2 terminal and run ``pacman -S mingw-w64-x86_64-gdb-multiarch``

Finally, you can run the "Ares GDB" configuration targeting the platform you are using. Make sure to have the rom started in Ares. You can build a rom for GDB debugging with ``make ARES_GDB=1`` (set to 1 by default)

You can find Dragorn's guide about how to use this [here](https://github.com/Dragorn421/z64-romhack-tutorials/blob/master/debugging/gdb/vscode.md#running).

## Contributing

All contributions are welcome. This is a group effort, and even small contributions can make a difference.
Some tasks also don't require much knowledge to get started.

Most discussions happen on our [Discord Server](https://discord.gg/brETAakcXr), where you are welcome to ask if you need help getting started, or if you have any questions regarding this project. **Feel free to ask any kind of questions.**

## Contributors

List of every HackerOoT contributors, from most recent to oldest contribution:

- Reonu
- Thar0
- recardo-7
- HailToDodongo
- CrashOverride95
- Trueffell
- Yanis42
- kurethedead
- zelllll
- ariahiro64
- ghost
- krm01