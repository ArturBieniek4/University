FROM debian:bullseye-backports

WORKDIR /root

RUN apt-get -q update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends -t bullseye-backports \
      git make gcc llvm-11 valgrind ca-certificates libc6-dev python3
