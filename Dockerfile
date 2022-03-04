FROM alpine AS openssl
RUN apk update && apk update
RUN apk add openssl