FROM frolvlad/alpine-gxx:latest AS build
WORKDIR /build

# Install boost & make
RUN apk add \
            boost-dev \
            make

COPY main.cc .
COPY Makefile .
RUN make

FROM alpine:3.6
RUN apk add --no-cache \
            libc6-compat \
            libstdc++

WORKDIR /opt
COPY --from=build /build/b.out .
CMD ["./b.out", "0.0.0.0", "9999"]
