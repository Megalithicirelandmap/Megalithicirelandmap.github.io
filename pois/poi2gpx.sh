#!/bin/sh

echo "do source $1" 1>&2
. "$1"
LAT=$(echo $latlon | cut -d , -f1)
LON=$(echo $latlon | cut -d , -f2)

NAME="$name"
CMT="$(basename $(dirname "$1"))%20list.htm"
URL="https://MegalithicIreland.com$url"
SYM="$sym"

export LAT LON NAME CMT URL SYM
envsubst < $0.tpl
