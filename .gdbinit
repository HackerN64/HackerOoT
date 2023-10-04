set remote noack-packet on
set output-radix 16
define target hookpost-remote
    source tools/gdb_load_ovl.py
end
