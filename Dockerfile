FROM openjdk:jre-slim

LABEL maintainer "https://github.com/blacktop"

RUN buildDeps='wget gnupg unzip git' \
    && apt-get update \
    && apt-get install -y $buildDeps python --no-install-recommends \
    && apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 379CE192D401AB61 \
    && echo "deb https://dl.bintray.com/kaitai-io/debian jessie main" \
    | tee /etc/apt/sources.list.d/kaitai.list \
    && apt-get update \
    && apt-get install -y kaitai-struct-compiler \
    && echo "===> Downloading Kaitai Struct WebIDE..." \
    && git clone --depth 1 https://github.com/kaitai-io/ide-kaitai-io.github.io /kaitai/webide \
    && echo "===> Downloading Kaitai Struct Formats..." \
    && cd /tmp \
    && wget https://github.com/kaitai-io/kaitai_struct_formats/archive/master.zip \
    && unzip master.zip \
    && mv kaitai_struct_formats-master/* /usr/share/kaitai-struct \
    && echo "===> Clean up unnecessary files..." \
    && rm -rf /usr/share/kaitai-struct/_build \
    && rm /usr/share/kaitai-struct/README.md \
    && echo ca-certificates-java hold | dpkg --set-selections \
    && echo openjdk-10-jre-headless hold | dpkg --set-selections \
    && apt-get purge -y --auto-remove $buildDeps  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives /tmp/* /var/tmp/*

WORKDIR /usr/share/kaitai-struct

COPY mach_o.ksy /usr/share/kaitai-struct/executable/
COPY mach_o.ksy /kaitai/webide/formats/executable/

EXPOSE 8000

ENTRYPOINT ["/usr/bin/kaitai-struct-compiler"]
CMD ["--help"]
