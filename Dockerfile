FROM nginx:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN apt-get clean

ARG OAUTH2_PROXY_VERSION=7.2.1
RUN wget https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v${OAUTH2_PROXY_VERSION}/oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz
RUN tar -xvf ./oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz && \
    install ./oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-amd64/oauth2-proxy /usr/sbin/

RUN rm -Rf ./oauth2-proxy*

COPY start.sh /root/
CMD ["/root/start.sh"]
