#!/bin/sh

for src in */xx????.gpx ; do
  dst="$(grep -hoE '<name>[^<]+' $src | cut -c 7- \
  | tr ' ' _  \
  | tr '/' -  \
  | tr -d "'()" )"
  mv $src $(dirname $src)/$dst.gpx
done
