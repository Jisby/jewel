#!/bin/bash
export ROOT_DIR="$HOME/proj/jewel/android/JewelWarrior"
make -e -I "$ROOT_DIR/build" $@

#DIRS="../src/styles ../src/scripts"
#for dir in $DIRS
#do
#    cd $dir
#    make -e -I "$ROOT_DIR/build" $@
#done
