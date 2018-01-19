FROM ubuntu:xenial
RUN apt-get update

# Install build tools/systems
RUN apt-get install -y ninja-build
RUN apt-get install -y automake
RUN apt-get install -y libtool-bin
RUN apt-get install -y pkg-config
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install meson

# Install easy dependencies
RUN apt-get install -y zlib1g-dev        # libzim kiwix-tools
RUN apt-get install -y liblzma-dev       # libzim
RUN apt-get install -y libicu-dev        # libzim kiwix-lib
RUN apt-get install -y libxapian-dev     # libzim kiwix-lib
RUN apt-get install -y libpugixml-dev    # kiwix-lib
RUN apt-get install -y libctpp2-dev      # kiwix-lib kiwix-tools
RUN apt-get install -y libmicrohttpd-dev # kiwix-tools

# Compile libzim
COPY libzim libzim
WORKDIR libzim
RUN mkdir build
RUN meson . build
WORKDIR build
RUN ninja
RUN ninja install
WORKDIR /

# Compile kiwix-lib
COPY kiwix-lib kiwix-lib
WORKDIR kiwix-lib
RUN mkdir build
RUN meson . build
WORKDIR build
RUN ninja
RUN ninja install
WORKDIR /

# Compile kiwix-tools
COPY kiwix-tools kiwix-tools
WORKDIR kiwix-tools
RUN mkdir build
RUN meson . build
WORKDIR build
RUN ninja
RUN ninja install
WORKDIR /

#EXPOSE 8080
#ENTRYPOINT ["kiwix-serve", "--port",  "8080", "--library", "/library.xml"]
