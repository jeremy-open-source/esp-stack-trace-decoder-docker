FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# cmake = required for 'addr-to-line' binary
RUN     apt-get update \
    &&  apt-get install -y \
            cmake \
            openjdk-8-jre \
            ca-certificates \
            curl \
            make

# Install Java Jar
# curl -O /opt/littleyoda/EspStackTraceDecoder/ https://github.com/littleyoda/EspStackTraceDecoder/releases/download/untagged-59a763238a6cedfe0362/EspStackTraceDecoder.jar
RUN     mkdir -p /opt/esp-stack-trace-decoder/bin/ \
    &&  chmod 777 -R /opt/esp-stack-trace-decoder
ADD bin /opt/esp-stack-trace-decoder/bin
ENV PATH /opt/esp-stack-trace-decoder/bin:$PATH
