#!/bin/bash

docker run -v $(pwd):/opt/project \
    -it --rm  \
    --hostname stm32-workspace \
    --workdir /opt/project \
    stm32-workspace:latest zsh