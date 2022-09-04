# Decompilation Assets Fixer (DAF)
The tool used for extract the assets ([ZAPD](https://github.com/zeldaret/ZAPD)) needs to be updated because it's using old names for structs and macros, this project is a workaround attempt until the main tool is updated.

## Usage
- Change the decomp path in ``data.py``
- Run ``daf.py`` (tested under Python 3.10, should work with 3.9+)
- If you have any issues when compiling the decomp, try ``make clean && make -j``, if it's not working feel free to open an issue on this repo

### Operating modes:
- ``daf.py -m (--mode) fix_types``, this will update types and macros, intended to be used after using ZAPD
- ``daf.py -m (--mode) name_entrances``, this will remove hex numbers from exit lists
- ``daf.py -m (--mode) fix_segments``, this will add casts to segment symbols inside room lists
- ``daf.py -a (--all)``, this will run all modes
- ``daf.py -v (--verbose)``, this will display extra informations
