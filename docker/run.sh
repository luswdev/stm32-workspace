#!/bin/bash

docker run -v $(pwd):/opt/project \
    -it --rm  \
    --hostname stm32-workspace \
    stm32-workspace:latest zsh