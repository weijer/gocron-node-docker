FROM alpine:3.7

RUN apk add --no-cache ca-certificates tzdata

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY gocron /app/

WORKDIR /app

EXPOSE 5920

ENTRYPOINT ["/app/gocron", "-allow-root"]