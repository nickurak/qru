#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Provide the thing to encode as the one and only parameter"
    exit 1
fi

qrencode -t UTF8 "$1"
