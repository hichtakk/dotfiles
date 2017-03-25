#!/bin/sh

for file in `ls`
do
  if [ $file != setup.sh -a $file != README.md ]; then
    if [ -e ~/.${file} ]; then
        mv ~/.${file} ~/.${file}.bak
    fi
    ln -s `pwd`/${file} ~/.${file}
  fi
done

