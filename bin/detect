#!/usr/bin/env bash

# this pack is valid for apps with a hello.txt in the root
if [ -f $1/.mono ]; then
  echo "Processing with mono repo buildpack"
  exit 0
else
  exit 1
fi