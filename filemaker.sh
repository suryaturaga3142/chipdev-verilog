#!/usr/bin/bash

BASE="$1"
TYPE="$2"
SRC=template_src.sv
TB=template_tb.sv
FILE_SRC="$BASE".sv
FILE_TB="$BASE"_tb.sv

if [ $# -le 1 ]; then
    echo "Error: Insufficient parameters."
    echo "Command: ./filemaker.sh <base_name> <type>"
    exit 2
elif [[ $1 =~ [\S]*(\.sv|_tb[\S]*)$ ]]; then
    echo "Error: Provide base name without extension or suffix."
    exit 2
fi

if [[ "$TYPE" =~ (SRC|BOTH)$ ]]; then
    touch "$FILE_SRC"
    if [ ! -s "$FILE_SRC" ]; then
        cat "$SRC" > "$FILE_SRC"
        sed -i -e 's/moduleName/"$BASE"/g' "$FILE_SRC"
    fi
fi
if [[ "$TYPE" =~ (TB|BOTH)$ ]]; then
    touch "$FILE_TB"
    if [ ! -s "$FILE_TB" ]; then
        cat "$TB" > "$FILE_TB"
    fi
fi