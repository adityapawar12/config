#!/bin/bash

# Create directories
mkdir -p ~/vicky/{pics,videos,music,softwares,streaming,coding,music-production,other}

# Create symbolic links if they don't already exist
if [ ! -e ~/Pictures ]; then
    ln -s ~/vicky/pics ~/Pictures
fi

if [ ! -e ~/Videos ]; then
    ln -s ~/vicky/videos ~/Videos
fi

if [ ! -e ~/Music ]; then
    ln -s ~/vicky/music ~/Music
fi
