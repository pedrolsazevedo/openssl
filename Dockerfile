FROM alpine AS openssl

RUN apk update && apk upgrade --no-cache

RUN apk add --no-cache openssl

ENTRYPOINT [ "openssl" ]