FROM debian:bullseye-backports

WORKDIR /root

RUN apt-get -q update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends -t bullseye-backports \
      git make gcc pkg-config valgrind ca-certificates libc6-dev python3
