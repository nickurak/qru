#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Provide the thing to encode as the one and only parameter"
    exit 1
fi

if [ "$1" = "-" ]; then
    exec qrencode -t UTF8
fi

exec qrencode -t UTF8 "$1"
