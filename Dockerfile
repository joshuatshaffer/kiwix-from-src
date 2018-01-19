FROM ubuntu:xenial
RUN apt-get update
RUN apt-get install -y libicu-dev
RUN apt-get install -y libzim-dev
RUN apt-get install -y libpugixml-dev
RUN apt-get install -y libctpp2-dev
RUN apt-get install -y libxapian-dev
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install pathlib
RUN pip install meson
RUN apt-get install -y ninja-build
WORKDIR /
EXPOSE 8080
ENTRYPOINT ["kiwix-serve", "--port",  "8080", "--library", "/library.xml"]
