FROM ohmyzsh/ohmyzsh:main

RUN install_packages \
	wget \
    make \
    cmake \
	bzip2

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2  -O gcc-arm-none-eabi-x86_64-linux.tar.bz2

RUN mkdir /opt/gcc-arm-none-eabi-x86_64-linux
RUN tar xjfv gcc-arm-none-eabi-x86_64-linux.tar.bz2 -C /opt/gcc-arm-none-eabi-x86_64-linux --strip-components=1

RUN rm gcc-arm-none-eabi-x86_64-linux.tar.bz2

# ENV PATH="/opt/gcc-arm-none-eabi/bin:${PATH}"
