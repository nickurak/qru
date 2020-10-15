FROM ubuntu as qru-ubuntu-base

FROM qru-ubuntu-base as qru-ubuntu-build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y git-core autoconf automake autotools-dev libtool pkg-config

RUN git clone https://github.com/fukuchi/libqrencode.git /app/src/

WORKDIR /app/src

RUN git checkout v4.0.2

RUN ./autogen.sh
RUN ./configure --without-png
RUN make
RUN make install

COPY qru-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/qru-entrypoint.sh

COPY qru.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/qru.sh

FROM qru-ubuntu-base
COPY --from=qru-ubuntu-build /usr/local /usr/local
RUN ldconfig

ENTRYPOINT ["/usr/local/bin/qru-entrypoint.sh"]
