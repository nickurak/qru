FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y autoconf automake autotools-dev libtool pkg-config libpng-dev
RUN apt-get install -q -y git-core

RUN git clone https://github.com/fukuchi/libqrencode.git /app/src/

WORKDIR /app/src


RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN ldconfig

COPY qru-entrypoint.sh /
RUN chmod a+x /qru-entrypoint.sh

COPY qru.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/qru.sh

ENTRYPOINT ["/qru-entrypoint.sh"]
