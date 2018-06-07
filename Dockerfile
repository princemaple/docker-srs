FROM debian:9

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends libpcre3 zlib1g git python sudo \
      automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev && \
    mkdir -p /data/install && \
    cd /data/install && \
    git clone https://github.com/ossrs/srs && cd srs/trunk && \
    ./configure && make && \
    apt-get remove -y --purge --auto-remove automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo 'daemon off;' >> /data/install/srs/trunk/conf/srs.conf

WORKDIR /data/install/srs/trunk
CMD ["./objs/srs", "-c", "conf/srs.conf"]
