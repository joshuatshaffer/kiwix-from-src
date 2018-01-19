FROM ubuntu:xenial
RUN apt-get update

# Install kiwix-lib dependencies
RUN apt-get install -y libicu-dev
RUN apt-get install -y libzim-dev
RUN apt-get install -y libpugixml-dev
RUN apt-get install -y libctpp2-dev
RUN apt-get install -y libxapian-dev

# Install build tools/systems
RUN apt-get install -y ninja-build
RUN apt-get install -y automake
RUN apt-get install -y libtool-bin
RUN apt-get install -y pkg-config
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install meson

# Compile kiwix-lib
COPY kiwix-lib kiwix-lib
WORKDIR kiwix-lib
RUN mkdir build
RUN meson . build
WORKDIR build
RUN ninja-build

WORKDIR /
#EXPOSE 8080
#ENTRYPOINT ["kiwix-serve", "--port",  "8080", "--library", "/library.xml"]
