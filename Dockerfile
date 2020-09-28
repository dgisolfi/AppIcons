FROM ubuntu:20.04
LABEL maintainer="Daniel Gisolfi"
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        inkscape

WORKDIR /themes