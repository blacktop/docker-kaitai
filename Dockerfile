FROM openjdk:slim

LABEL maintainer "https://github.com/blacktop"

RUN apt-get update \
    && apt-get install -y gnupg ca-certificates \
    && apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 379CE192D401AB61 \
    && echo "deb https://dl.bintray.com/kaitai-io/debian jessie main" \
    | tee /etc/apt/sources.list.d/kaitai.list \
    && apt-get update \
    && apt-get install -y kaitai-struct-compiler \
    && echo "===> Clean up unnecessary files..." \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives /tmp/* /var/tmp/*

WORKDIR /usr/share/kaitai-struct

COPY mach_o.ksy /usr/share/kaitai-struct

ENTRYPOINT ["/usr/bin/kaitai-struct-compiler"]
CMD ["--help"]
