FROM golang:1.18-bullseye AS builder

ARG OAUTH2_PROXY_VERSION=7.2.1
RUN go install github.com/oauth2-proxy/oauth2-proxy/v7@v${OAUTH2_PROXY_VERSION}

FROM nginx:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN apt-get clean

COPY --from=builder /go/bin/oauth2-proxy /usr/sbin/
COPY start.sh /root/
CMD ["/root/start.sh"]
