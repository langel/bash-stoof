#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "no characters to hex out :("
fi
CHARS=$1
echo -n ${CHARS} | hexdump

