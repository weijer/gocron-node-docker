FROM alpine:3.7

RUN apk add --no-cache ca-certificates tzdata \
    && addgroup -S app \
    && adduser -S -g app app

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /app

COPY gocron /app/

RUN chown -R root:root /app/gocron

EXPOSE 5920

USER root

ENTRYPOINT ["/app/gocron", "web"]