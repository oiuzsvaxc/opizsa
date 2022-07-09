FROM alpine:edge

ARG AUUID="4a1ff314-143f-4cb1-a9f0-24b80eea2cf3"
ARG CADDYIndexPage="https://github.com/sweetield/indexpage/blob/main/README.md"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
