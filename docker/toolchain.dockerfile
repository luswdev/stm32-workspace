FROM ohmyzsh/ohmyzsh:main

RUN install_packages \
	wget \
    make \
    cmake \
	bzip2

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-aarch64-linux.tar.bz2 -O toolchain.tar.bz2

RUN mkdir /opt/gcc-arm-none-eabi && tar xjfv toolchain.tar.bz2 -C /opt/gcc-arm-none-eabi --strip-components 1

RUN rm toolchain.tar.bz2

# ENV PATH="/opt/gcc-arm-none-eabi/bin:${PATH}"
