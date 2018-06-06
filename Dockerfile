FROM debian:9

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends libpcre3 zli git python3 sudo \
      b1g automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev && \
    mkdir -p /data/install && \
    cd /data/install && \
    git clone https://github.com/ossrs/srs && cd srs/trunk && \
    ./configure && make

WORKDIR /data/install/srs/trunk
CMD ["./objs/srs", "-c", "conf/srs.conf"]
