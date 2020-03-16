FROM gcc:latest AS build
WORKDIR /build
COPY main.cc .
COPY Makefile .
RUN make

#FROM ubuntu:bionic
FROM alpine:3.6
RUN apk add --no-cache \
        libc6-compat \
        libstdc++
WORKDIR /opt
COPY --from=build /build/b.out .
CMD ["./b.out"]
