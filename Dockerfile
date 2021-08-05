FROM chinachu/mirakurun:latest AS build

WORKDIR /
RUN apt-get update && \
    apt-get install -y git autoconf automake
RUN git clone https://github.com/stz2012/recpt1.git
WORKDIR /recpt1/recpt1/
RUN ./autogen.sh
RUN ./configure --enable-b25
RUN make

FROM chinachu/mirakurun:latest
COPY --from=build /recpt1/recpt1/recpt1 /usr/local/bin/
