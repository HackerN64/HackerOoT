# Hacker Zelda: Ocarina of Time (HackerOoT)

[![Contributors][contributors-badge]][contributors]

[contributors]: https://github.com/HackerN64/HackerOoT/graphs/contributors
[contributors-badge]: https://img.shields.io/github/contributors/HackerN64/HackerOoT

This project, based on the [Zelda: Ocarina of Time decompilation project](https://github.com/zeldaret/oot/), aims to be an easy-to-use base to make Zelda: Ocarina of Time mods. **It is not producing a PC port.**

It builds the following versions:

| Name         | Build timestamp   | Description                               | MD5 hash of input ROM(s) |
|--------------|-------------------|-------------------------------------------|--------------------------|
| ntsc-1.0     | 98-10-21 04:56:31 | NTSC 1.0 (Japan/US)                       | `9f04c8e68534b870f707c247fa4b50fc`<br>`5bd1fe107bf8106b2ab6650abecd54d6` |
| ntsc-1.1     | 98-10-26 10:58:45 | NTSC 1.1 (Japan/US)                       | `1bf5f42b98c3e97948f01155f12e2d88`<br>`721fdcc6f5f34be55c43a807f2a16af4` |
| pal-1.0      | 98-11-10 14:34:22 | PAL 1.0 (Europe)                          | `e040de91a74b61e3201db0e2323f768a` |
| ntsc-1.2     | 98-11-12 18:17:03 | NTSC 1.2 (Japan/US)                       | `2258052847bdd056c8406a9ef6427f13`<br>`57a9719ad547c516342e1a15d5c28c3d` |
| pal-1.1      | 98-11-18 17:36:49 | PAL 1.1 (Europe)                          | `d714580dd74c2c033f5e1b6dc0aeac77` |
| gc-jp        | 02-10-29 23:49:53 | GameCube Japan                            | `33fb7852c180b18ea0b9620b630f413f` |
| gc-jp-mq     | 02-10-30 00:15:15 | GameCube Japan Master Quest               | `69895c5c78442260f6eafb2506dc482a` |
| gc-us        | 02-12-19 13:28:09 | GameCube US                               | `cd09029edcfb7c097ac01986a0f83d3f` |
| gc-us-mq     | 02-12-19 14:05:42 | GameCube US Master Quest                  | `da35577fe54579f6a266931cc75f512d` |
| gc-eu-mq-dbg | 03-02-21 00:16:31 | GameCube Europe/PAL Master Quest Debug    | `75e344f41c26ec2ec5ad92caa9e25629`<br>`8ca71e87de4ce5e9f6ec916202a623e9`<br>`f751d1a097764e2337b1ac9ba1e27699`<br>`dde376d47187b931820d5b2957cded14` |
| gc-eu        | 03-02-21 20:12:23 | GameCube Europe/PAL                       | `2c27b4e000e85fd78dbca551f1b1c965` |
| gc-eu-mq     | 03-02-21 20:37:19 | GameCube Europe/PAL Master Quest          | `1618403427e4344a57833043db5ce3c3` |
| gc-jp-ce     | 03-10-08 21:53:00 | GameCube Japan (Collector's Edition Disc) | `0c13e0449a28ea5b925cdb8af8d29768` |
| ique-cn      | 03-10-22 16:23:19 | iQue Player (Simplified Chinese)          | `0ab48b2d44a74b3bb2d384f6170c2742` |

The default version is `ntsc-1.2`.

This project is using the following tools:
- [F3DEX3](https://github.com/HackerN64/F3DEX3), *will make you want to finally ditch HLE*, by Sauraen
- [gzinject](https://github.com/krimtonz/gzinject), *injector for gz*, by krimtonz
- [z64compress](https://github.com/z64tools/z64compress), *the fastest Zelda 64 rom compressor*, by z64tools
- [Flips](https://github.com/Alcaro/Flips), *patcher for IPS and BPS files*, by Alcaro
- [New Actor Script](https://github.com/hiisuya/oot_new_actor), *Python script and files to automate creating a new actor*, by hiisuya

**Note: This repository does not include any of the assets necessary to build the ROM. A prior copy of the game is required to extract the needed assets.**

## HackerN64

**Discord:** <https://discord.gg/brETAakcXr>

## Zelda: Ocarina of Time Decompilation

**Website:** <https://zelda.deco.mp>

## Getting Started

The Expansion Pak is required by default. While it's possible to use 4MB of memory, this is not recommended for mods (and untested) but technically possible by removing debug features.

### Installation

Instructions to build this project are available [here](INSTALLATION.md).

Note: the [F3DEX3](https://github.com/HackerN64/F3DEX3) microcode is enabled by default. You will need a platform supporting LLE (like Ares or Parallel Launcher) to be able to use it. To turn it off set the ``ENABLE_F3DEX3`` define from ``config_graphics.h`` to ``false``, then run ``make clean`` and ``make``.

### Modding

HackerOoT features are listed in the config headers under ``include/config/``.

This project includes an example scene, available if ``INCLUDE_EXAMPLE_SCENE`` is set to ``true``. It's accessible from the map select.

This also includes an example cutscene, playable in the example scene when holding ``L`` + ``R`` and pressing ``A``.

Use ``./new_actor.py --help`` for instructions on easily adding a new actor to the game.

## Changing build options

The project Makefile is fairly configurable and can be used to build other versions of the game or prepare the repo for modding.
See the options outlined at the top of the Makefile for more information.

## Contributing

All contributions are welcome. This is a group effort, and even small contributions can make a difference.
Some tasks also don't require much knowledge to get started.

Most discussions happen on our [Discord Server](https://discord.gg/brETAakcXr), where you are welcome to ask if you need help getting started, or if you have any questions regarding this project. **Feel free to ask any kind of questions.**

## Contributors

List of every HackerOoT contributors, from most recent to oldest contribution:

- hiisuya
- Zeldaboy14
- Sauraen
- Reonu
- Thar0
- recardo-7
- HailToDodongo
- CrashOverride95
- Trueffell
- Yanis002
- kurethedead
- zelllll
- ariahiro64
- ghost
- krm01

New Animated Materials types based on [z64rom](https://github.com/z64dev/z64rom/blob/main/project/src/lib_user/library/SceneRender.c). Special thanks to Nokaubure, rankaisija, z64me and the other contributors from that project.
