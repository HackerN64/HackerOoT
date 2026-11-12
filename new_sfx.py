#!/usr/bin/env python3
"""
Adds a new sound effect to the project by processing a .wav file,
updating necessary XML / build files and creating an enum that can
be called in game. Covers 80% of use cases where you just want to
add a new SFX and play it as a oneshot in code. Taken from Indigo
project, this script can be freely used/shared without attribution
"""

import os
import re
import sys
import shutil
import argparse
import logging
import subprocess
import textwrap
import xml.etree.ElementTree
import xml.dom.minidom
from pathlib import Path


LOG: logging.Logger             = logging.getLogger(f"[{Path(__file__).name}]")
LOG_LEVEL: int                  = logging.INFO

EXTRACTED_PATH: Path            = Path("extracted")
SAMPLEBANK_NAME: str            = "SampleBank_0"
ASSETS_SAMPLES_PATH: Path       = Path("assets") / "audio" / "samples" / SAMPLEBANK_NAME 
ASSETS_SAMPLEBANK_XML: Path     = Path("assets") / "audio" / "samplebanks" / (SAMPLEBANK_NAME + ".xml")
ASSETS_SOUNDFONT_XML: Path      = Path("assets") / "audio" / "soundfonts" / "Soundfont_0.xml"
ASSETS_SEQUENCE_SEQ: Path       = Path("assets") / "audio" / "sequences" / "seq_0.prg.seq"
REPLACEMENT_PATTERN: str        = "[^0-9a-zA-Z]+"
SFX_BANK_HEADER: Path           = Path("include") / "tables" / "sfx" / "environmentbank_table.h"
DEFINE_FORMATSTR: str           = "             DEFINE_SFX({0}, {1}, 0x80, 0, 0, 0)"


class FFMPEGOptions:
    def __init__(self, volume:str=None, sample_rate:str="32000"):
        self.volume:str = volume
        self.sample_rate:str = sample_rate

class CustomSoundEffect:
    def __init__(self, sample_path: Path):
        self.source_path: Path = sample_path
        self.dest_path: Path = CustomSoundEffect._safe_rename(sample_path)
        id_base = self.dest_path.stem.upper()
        self.sample_identifier: str     = f"CUSTOM_SAMPLE_{id_base}"
        self.effect_identifier: str     = f"CUSTOM_EFFECT_{id_base}"
        self.channel_identifier: str    = f"CHAN_CUSTOM_{id_base}"
        self.layer_identifier: str      = f"LAYER_CUSTOM_{id_base}"
        self.enum_identifier: str       = f"NA_SE_EV_CUSTOM_{id_base}"
    
    def _safe_rename(sample_path: Path) -> Path:
        new_name: str = re.sub(REPLACEMENT_PATTERN, "_", sample_path.stem) + sample_path.suffix
        if new_name != sample_path.name:
            LOG.info(f"sanitizing name of sample, new name: '{new_name}'")
        
        new_path = ASSETS_SAMPLES_PATH / new_name 
        if new_path.exists():
            LOG.warning(f"filename already exists! sample will be overwritten! '{new_name}'")

        return new_path


def _write_xml_pretty(tree: xml.etree.ElementTree, path: Path) -> None:
    rough_string = xml.etree.ElementTree.tostring(tree, 'utf-8')
    reparsed = xml.dom.minidom.parseString(rough_string)
    pretty = reparsed.toprettyxml(indent="    ")
    trimmed = os.linesep.join([s for s in pretty.splitlines() if s.strip()])
    with open(path, "w") as fd:
        fd.write(trimmed)
        fd.write("\n")


def prepare_directories() -> None:
    os.makedirs(ASSETS_SAMPLES_PATH, exist_ok=True)
    os.makedirs(ASSETS_SAMPLEBANK_XML.parent, exist_ok=True)
    os.makedirs(ASSETS_SOUNDFONT_XML.parent, exist_ok=True)

    games: list[str] = os.listdir(EXTRACTED_PATH)
    if len(games) == 0:
        LOG.error("No assets found in extracted/, 'make setup' not yet run?")
        sys.exit(1)
    # just use the first one found, it's fine (probably)
    game = games[0]

    if ASSETS_SAMPLEBANK_XML.exists():
        LOG.info(f"existing {ASSETS_SAMPLEBANK_XML.name} found")
    else:
        samplebank_xml = EXTRACTED_PATH / game / ASSETS_SAMPLEBANK_XML
        if not samplebank_xml.exists():
            LOG.error(f"{samplebank_xml} does not exist")
            sys.exit(1)
        
        LOG.info(f"copying fresh {ASSETS_SAMPLEBANK_XML.name} to assets")
        shutil.copy(samplebank_xml, ASSETS_SAMPLEBANK_XML)

    if ASSETS_SOUNDFONT_XML.exists():
        LOG.info(f"existing {ASSETS_SOUNDFONT_XML.name} found")
    else:
        soundfont_xml = EXTRACTED_PATH / game / ASSETS_SOUNDFONT_XML
        if not soundfont_xml.exists():
            LOG.error(f"{soundfont_xml} does not exist")
            sys.exit(1)
        
        LOG.info(f"copying fresh {ASSETS_SOUNDFONT_XML.name} to assets")
        shutil.copy(soundfont_xml, ASSETS_SOUNDFONT_XML)


def process_wav(sfx: CustomSoundEffect, options: FFMPEGOptions) -> None:
    LOG.info("processing sample with ffmpeg...")
    args = ["ffmpeg", "-i", sfx.source_path, "-ac", "1", "-acodec", "pcm_s16le"]
    if options.sample_rate is not None:
        LOG.info(f"   Changing sample rate to {options.sample_rate}")
        args += ["-ar", options.sample_rate]
    if options.volume is not None:
        LOG.info(f"   Changing volume to {options.volume}")
        args += ["-af", f"volume={options.volume}"]
    args += [sfx.dest_path, "-y"]
    outstream = None if LOG_LEVEL == logging.DEBUG else subprocess.DEVNULL

    try:
        subprocess.run(args, check=True, stdout=outstream, stderr=outstream)
    except Exception as ex:
        LOG.error(f"ffmpeg failed to convert sample! {sfx.source_path.name}")
        sys.exit(1)


def update_samplebank(sfx: CustomSoundEffect) -> None:
    LOG.info(f"updating {ASSETS_SAMPLEBANK_XML}...")
    et: xml.etree.ElementTree = xml.etree.ElementTree.parse(ASSETS_SAMPLEBANK_XML).getroot()
    for it in et:
        if it.attrib.get("Name", "") == sfx.sample_identifier:
            LOG.warning(f"Sample entry {sfx.sample_identifier} already found in SampleBank!")
            return

    new_tag = xml.etree.ElementTree.SubElement(et, "Sample")
    new_tag.attrib["Name"] = sfx.sample_identifier
    new_tag.attrib["Path"] = str(Path("$(BUILD_DIR)") / str(sfx.dest_path).replace(".wav", ".aifc"))

    _write_xml_pretty(et, ASSETS_SAMPLEBANK_XML)


def update_bank_header(sfx: CustomSoundEffect) -> None:
    LOG.info(f"updating bank header {SFX_BANK_HEADER}...")
    with open(SFX_BANK_HEADER) as fd:
        lines = fd.readlines()
    
    for line in lines:
        if sfx.enum_identifier in line:
            LOG.warning(f"Enum already defined in sfx bank header! '{sfx.enum_identifier}'")
            return
    
    with open(SFX_BANK_HEADER, "a") as fd:
        fd.write(DEFINE_FORMATSTR.format(sfx.channel_identifier, sfx.enum_identifier))
        fd.write("\n")


def update_soundfont(sfx: CustomSoundEffect) -> None:
    LOG.info(f"updating {ASSETS_SOUNDFONT_XML}...")
    et: xml.etree.ElementTree = xml.etree.ElementTree.parse(ASSETS_SOUNDFONT_XML).getroot()

    def _check_element_exists(group: str, name: str):
        for it in et.find(group):
            if it.attrib.get("Name", "") == name:
                LOG.warning(f"{group} entry {name} already found in Soundfont!")
                return True
        return False

    # update the <Samples> list
    if not _check_element_exists("Samples", sfx.sample_identifier):
        new_tag = xml.etree.ElementTree.SubElement(et.find("Samples"), "Sample")
        new_tag.attrib["Name"] = sfx.sample_identifier
    
    # update the <Effects> list
    if not _check_element_exists("Effects", sfx.effect_identifier):
        new_tag = xml.etree.ElementTree.SubElement(et.find("Effects"), "Effect")
        new_tag.attrib["Name"] = sfx.effect_identifier
        new_tag.attrib["Sample"] = sfx.sample_identifier

    _write_xml_pretty(et, ASSETS_SOUNDFONT_XML)


def update_sequence(sfx: CustomSoundEffect) -> None:
    LOG.info(f"updating {ASSETS_SEQUENCE_SEQ}...")
    with open(ASSETS_SEQUENCE_SEQ) as fd:
        # this is totally safe
        head, sep, tail = fd.read().partition("SEQ_0_END:\n")
    
    if sfx.channel_identifier in head or sfx.channel_identifier in tail:
        LOG.warning(f"Assembly for {sfx.channel_identifier} already found in sequence!")
        return

    # transposes down to [0, 63] to fit into 6 bits for notedv
    playsfx_define = textwrap.dedent("""
        #define PLAYSFX(effect)                         \\
        .if (effect >= 64);                             \\
            transpose (effect/64);                      \\
        .endif;                                         \\
            instr FONTANY_INSTR_SFX;                    \\
            notedv (effect - (effect/64) * 64), 0, 127; \\

    """)
    assembly = textwrap.dedent(f"""
        .channel {sfx.channel_identifier}
            ldlayer     0, {sfx.layer_identifier}
            end

        .layer {sfx.layer_identifier}
            PLAYSFX(SF0_{sfx.effect_identifier})
            end

        """)
    
    with open(ASSETS_SEQUENCE_SEQ, "w") as fd:
        fd.write(head)
        if "#define PLAYSFX(effect)" not in head:
            fd.write(playsfx_define)
        fd.write(assembly)
        fd.write(sep)
        fd.write(tail)


def main(sample_path: Path, options: FFMPEGOptions) -> None:
    prepare_directories()
    sfx = CustomSoundEffect(sample_path)
    process_wav(sfx, options)
    update_samplebank(sfx)
    update_bank_header(sfx)
    update_soundfont(sfx)
    update_sequence(sfx)
    LOG.info(f"Success! {sfx.enum_identifier} has been added!")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=textwrap.dedent(
        """Add a new sound effect.
        This script can be safely re-run multiple times to tweak parameters
        like volume and sample rate of the .wav file."""))
    parser.add_argument("sample", help = "Path to the sample.wav file to add")
    parser.add_argument("--debug", help="Print extra debug info while converting sample.", action="store_true")
    parser.add_argument("--volume", required=False, help="Change volume of sample. Provide a decimal, e.g. 1.0", default=None)
    parser.add_argument("--sample_rate", required=False, help="Change sample rate. Provide an integer. By default will be set to 32000", default="32000")
    args = parser.parse_args()

    if args.debug:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=LOG_LEVEL)

    sample_path = Path(args.sample)

    if not shutil.which("ffmpeg"):
        LOG.error("ffmpeg not found, aborting")
        sys.exit(1)

    # jank but check some expected files as a minor safety net that the CWD is correct
    if not Path("src").exists() or not Path("spec").exists():
        LOG.error(f"{Path(__file__).name} does not seem to be in the repo root directory.")
        sys.exit(1)
    
    if sample_path.suffix != ".wav":
        LOG.error("expected sample to be a .wav file extension")
        sys.exit(1)
    
    if not sample_path.exists():
        LOG.error(f"file not found '{sample_path}'")
        sys.exit(1)
    
    options = FFMPEGOptions(volume=args.volume, sample_rate=args.sample_rate)
    
    main(sample_path, options)
