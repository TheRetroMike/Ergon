FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/Ergon-moe/Bitcoin-Static/releases/download/v24.0.5/bitcoin-static-24.0.5-x86_64-linux-gnu.tar.gz
RUN tar zxvf bitcoin-static-24.0.5-x86_64-linux-gnu.tar.gz
RUN mv bitcoin-static-24.0.5/bin/bitcoind /usr/bin
RUN mv bitcoin-static-24.0.5/bin/bitcoin-cli /usr/bin
RUN rm bitcoin-static-24.0.5-x86_64-linux-gnu.tar.gz
RUN rm -R bitcoin-static-24.0.5
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/bitcoind -printtoconsole
