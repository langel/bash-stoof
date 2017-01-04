#!/bin/bash
read -r -p "Recursively remove all swap files? [Y/n]" response
if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
  echo "CLEANING HOUSE!! :U"
  find ./ -type f -name "\.*sw[klmnop]" -delete
fi

