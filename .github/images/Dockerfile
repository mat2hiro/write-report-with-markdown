FROM kumassy/alpine-pandoc-ja

WORKDIR /src

COPY ./ /src

RUN ls -la

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git

# you can add tex packages by tlmgr install.
# RUN tlmgr install algorithms algorithmicx algorithm2e

RUN wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-linux-amd64.tar.gz
RUN tar xvfz pandoc-2.9.1.1-linux-amd64.tar.gz
RUN cp pandoc-2.9.1.1/bin/* /usr/local/bin/

RUN rm -r /usr/bin/pandoc-crossref && wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.6.1a/linux-pandoc_2_9_1.tar.gz -q -O - | tar xz \
  && mv pandoc-crossref /usr/bin/
