FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -OL https://github.com/Griesbacher/nagflux/releases/download/v0.4.1/nagflux && chmod +x nagflux
COPY config.gcfg /config.gcfg
COPY start.sh /start.sh

CMD [ "/start.sh" ]
