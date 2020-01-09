FROM kumassy/alpine-pandoc-ja

WORKDIR /src

COPY ./ /src

RUN ls -la

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git
