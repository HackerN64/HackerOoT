# VSCode

A lot of people on this project use VSCode as their coding environment.

## Extensions

There are a number of useful extensions available to make work more efficient:

- C/C++ IntelliSense
- Clang-Format
- HexInspector (hover on numbers for float and other info)
- NumberMonger (convert hex to decimal and vice versa)
- Better MIPS Support




## Useful keyboard shortcuts

- Ctrl + Alt + Up/Down (on Windows, on Linux it's Ctrl + Shift + Up/Down or Shift + Alt + Up/Down) gives multicursors across consecutive lines. If you want several cursors in a more diverse arrangement, middle clicking works, at least on Windows.
- Alt + Up/Down moves lines up/down.
- Shift + Alt + Up/Down (Linux: Ctrl + Shift + Alt + Up/Down) copies lines up/down.
- Ctrl + P offers a box to use to search for and open files.
- Ctrl + Shift + P offers a box for commands like editing settings or reloading the window.

- Make use of VSCode's search/search-and-replace features.
    - Ctrl + Click goes to a definition.
    - Ctrl + F for search in current file
    - Ctrl + H for replace in current file
    - Ctrl + Shift + F for search in all files
    - Ctrl + Shift + H for replace in all files
    - F2 for Rename symbol

Many of VS Code's other shortcuts can be found on [its getting started page](https://code.visualstudio.com/docs/getstarted/keybindings), which also has links to OS-specific PDFs.

## C/C++ configuration

You can create a `.vscode/c_cpp_properties.json` file with `C/C++: Edit Configurations (JSON)` in the command box to customise how IntelliSense reads the repository (stuff like where to look for includes, flags, compiler defines, etc.) to make VSCode's IntelliSense plugin better able to understand the structure of the repository.

Below is a good default one to use for this project's repository, for the oot-gc-eu-mq-dbg version specifically.

A more complete `c_cpp_properties.json` with configurations for all supported versions [can be found here](c_cpp_properties.json).

```jsonc
{
    "configurations": [
        {
            "name": "ntsc-1.2",
            "compilerArgs": [
                "-m32" // Removes integer truncation warnings with gbi macros
            ],
            "includePath": [ // Matches makefile's includes
                "include",
                "include/libc",
                "src",
                "build/ntsc-1.2",
                ".",
                "extracted/ntsc-1.2"
            ],
            "defines": [
                "_LANGUAGE_C", // For gbi.h
                "ENABLE_HACKEROOT=1",
                "COMPRESS_YAZ=1",
                // Version-specific
                "OOT_VERSION=GC_EU_MQ_DBG",
                "OOT_REGION=REGION_EU",
                "PLATFORM_N64=0",
                "PLATFORM_GC=1",
                "DEBUG_FEATURES=1",
                "F3DEX_GBI_2",
                "F3DEX_GBI_PL",
                "GBI_DOWHILE",
                "GBI_DEBUG"
            ],
            "cStandard": "gnu89", // C89 + some GNU extensions from C99 like C++ comments
        }
    ],
    "version": 4
}
```

## Settings

Add the following to (or create) the `.vscode/settings.json` file for VSCode to search the gitignored asset files by default:

```jsonc
{
    "search.useIgnoreFiles": false,
    "search.exclude": {
        "**/.git": true,
        "baseroms/**": true,
        "build/**": true,
        "expected/**": true,
    },
}
```

## GDB Launch File
```jsonc
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Ares GDB (Linux)",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/build/ntsc-1.2/oot-ntsc-1.2.elf",
            "cwd": "${workspaceFolder}",
            "stopAtEntry": false,
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "/usr/bin/gdb-multiarch",
            "miDebuggerServerAddress": "tcp:172.0.0.1:9123", // change this to your Linux/WSL IP address
        },
        {
            "name": "Ares GDB (Windows)",
            "type": "cppdbg",
            "request": "launch",
            "program": "windows_path_to_HackerOoT.elf",
            "cwd": "windows_path_to_folder_containing_HackerOoT.elf",
            "stopAtEntry": true,
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "/mnt/c/msys64/mingw64/bin/gdb-multiarch.exe",
            "miDebuggerServerAddress": "[::1]:9123",
        }
    ]
}
```
