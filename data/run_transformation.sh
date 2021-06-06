#!/bin/sh

cat ar_dec_positions.txt | awk '{ printf("%s,%s\n", $7, $8); }' FS=':' - | sed 's:,"dec"::' | awk -f transform_coords.awk FS=',' - > ecliptic_pos.txt
