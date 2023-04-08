FROM ohmyzsh/ohmyzsh:main

RUN apt-get update
RUN apt-get install -y \
    curl \
    make \
    cmake \
    gcc \
    g++ \
    libssl-dev \
    bzip2

RUN curl -Lo gcc-arm-none-eabi-x86_64-linux.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2"

RUN mkdir /opt/gcc-arm-none-eabi-x86_64-linux
RUN tar xjfv gcc-arm-none-eabi-x86_64-linux.tar.bz2 -C /opt/gcc-arm-none-eabi-x86_64-linux --strip-components=1

RUN rm gcc-arm-none-eabi-x86_64-linux.tar.bz2

RUN curl -Lo cmake.tar.gz "https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz"
RUN tar xzfv cmake.tar.gz

RUN cd cmake-3.26.3 && cmake .
RUN cd cmake-3.26.3 && make
RUN cd cmake-3.26.3 && make install

RUN rm -rf cmake.tar.gz cmake-3.26.3

RUN cmake --version
