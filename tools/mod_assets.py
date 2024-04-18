#!/usr/bin/env python3
"""
copies mod_assets into assets. assumes file is located at project root
"""
import os
import shutil
import time
import glob
import typing as T
from pathlib import Path


def log(msg: str):
    print(f"[{__file__}]: {msg}")


def remove_stale_assets(root: str, copied_files: T.List[str], last_cache_time: int):
    modified_times: T.Dict[str, int] = {
        file: int(os.path.getmtime(file)) for file in copied_files
    }
    stale = [file for file, ts in modified_times.items() if ts > last_cache_time]

    if len(stale) == 0:
        log(f"No stale assets since last build")
        return

    removed_count = 0
    for file in stale:
        rel = os.path.relpath(file, root)
        pattern = os.path.join(root, "build", os.path.dirname(rel), "*")
        for match in glob.glob(pattern, recursive=True):
            os.remove(match)
            removed_count += 1

    log(f"Removed {removed_count} stale asset(s) from {root}")


def copy_all(root: str) -> T.List[str]:
    src_root = os.path.join(root, "mod_assets")
    dst_root = os.path.join(root, "assets")
    copied_files: T.List[str] = []
    for src_dir, _, file_names in os.walk(src_root):
        dst_dir = src_dir.replace(src_root, dst_root, 1)
        Path(dst_dir).mkdir(parents=True, exist_ok=True)
        for file_name in file_names:
            src_file = os.path.join(src_dir, file_name)
            dst_file = os.path.join(dst_dir, file_name)
            shutil.copy2(src_file, dst_file)
            copied_files.append(dst_file)

    log(f"Copied {len(copied_files)} file(s) from mod_assets")
    return copied_files


def remove_stale_actors(root: str, last_cache_time: int):
    actors_src_dir = os.path.join(root, "src", "overlays", "actors")
    actors_build_dir = os.path.join(root, "build", "src", "overlays", "actors")
    stale_directories = set()
    for actor_dir, _, actor_files in os.walk(actors_src_dir):
        for actor_file in actor_files:
            modified_time = os.path.getmtime(os.path.join(actor_dir, actor_file))
            if modified_time > last_cache_time:
                stale_directories.add(actor_dir)

    removed = 0
    for actor_dir in stale_directories:
        overlay_name = os.path.split(actor_dir)[1]
        build_path = os.path.join(actors_build_dir, overlay_name)
        if os.path.exists(build_path):
            log(f"Removing stale actor {overlay_name}")
            shutil.rmtree(build_path)
            removed += 1

    if removed == 0:
        log("No stale actors since last build")
    else:
        log(f"Removed {removed} total stale actors")


def update_cache_time(root: str) -> int:
    build_dir = os.path.join(root, "build")
    if not os.path.exists(build_dir):
        os.mkdir(build_dir)
    cache_file = os.path.join(build_dir, ".mod_assets_cache")
    if os.path.exists(cache_file):
        with open(cache_file) as fd:
            last_time = int(fd.read().strip())
    else:
        last_time = 0

    with open(cache_file, "w") as fd:
        fd.write(f"{int(time.time())}")
        log(f"Updated {cache_file}")
    return last_time


def main():
    root = os.path.dirname(os.path.realpath(__file__)).removesuffix("/tools")
    last_cache_time = update_cache_time(root)
    copied_files = copy_all(root)
    remove_stale_assets(root, copied_files, last_cache_time)
    # check actor overlays for stale include dependencies i.e. "*.inc.c"
    remove_stale_actors(root, last_cache_time)


if __name__ == "__main__":
    main()
