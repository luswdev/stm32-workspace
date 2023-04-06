#!/bin/bash

ARCH=$(dpkg --print-architecture)

case $ARCH in
    darwin-arm64)
        echo "Build docker image for Apple Silicon"
        docker build --platform linux/arm64/v8 --network=host -t stm32-workspace .. -f toolchain.dockerfile
        ;;
    *)
        echo "Build docker image for general platform"
        docker build --network=host -t stm32-workspace .. -f toolchain.dockerfile
        ;;
esac
