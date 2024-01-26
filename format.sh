#!/bin/bash

# Replaced tabs with spaces
sed -i $'s/\t/ /g' pico-8-game.p8

# Remove trailing whitespace
sed -i 's/[ \t]*$//' pico-8-game.p8