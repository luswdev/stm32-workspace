#!/bin/bash
export LANG="CPP"

mkdir -p build
cd build

cmake ..

make clean
make -j`nproc` $1
