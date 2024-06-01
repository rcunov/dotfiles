#!/bin/bash

rm -rf ~/.config/nvim
cp -rsv $(readlink -f ./.config/*) ~/.config/
