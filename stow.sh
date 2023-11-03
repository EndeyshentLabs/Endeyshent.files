#!/bin/sh
for dir in */; do stow -v -R -t "$HOME" "$dir"; echo; done
