FROM dockage/alpine:3.7

ENV GEARMAND_VERSION=1.1.18

RUN apk add --no-cache --virtual .build-deps \
      wget \
      tar \
      ca-certificates \
      file \
      mariadb-dev \
      alpine-sdk \
      gperf \
      boost-dev \
      libevent-dev \
      util-linux-dev \
      hiredis-dev \
      libressl-dev && \
      rm -rf /build /var/cache/apk/*


ADD https://github.com/gearman/gearmand/releases/download/${GEARMAND_VERSION}/gearmand-${GEARMAND_VERSION}.tar.gz /build/gearmand.tar.gz
# patches from alpine official gearman package
ADD https://git.alpinelinux.org/cgit/aports/plain/testing/gearmand/libhashkit-common.h.patch /libhashkit-common.h.patch
ADD https://git.alpinelinux.org/cgit/aports/plain/testing/gearmand/libtest-cmdline.cc.patch /libtest-cmdline.cc.patch

RUN cd /build && tar -xvf gearmand.tar.gz && cd gearmand-* && \
      patch -p1 < /libhashkit-common.h.patch && \
	    patch -p1 < /libtest-cmdline.cc.patch && \
      ./configure \
        --build=$(gcc -dumpmachine) \
        --host=$(gcc -dumpmachine) \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --localstatedir=/var \
        --with-mysql=/usr/bin/mysql_config \
        --with-postgresql=no \
        --disable-libpq \
        --disable-libtokyocabinet \
        --disable-libdrizzle \
        --disable-libmemcached \
        --enable-hiredis \
        --enable-ssl \
        --enable-jobserver=no && \
      make && \
      make install && \
      cd / && rm -rf /build

EXPOSE 4730/tcp

ENTRYPOINT ["/usr/sbin/gearmand"]
