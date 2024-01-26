#!/bin/bash

# Replaced tabs with spaces
sed -i $'s/\t/ /g' chicken-road.p8

# Remove trailing whitespace
sed -i 's/[ \t]*$//' chicken-road.p8
