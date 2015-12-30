FROM alpine:edge

ENV PASSWORD "emptyPassword"
ENV EXIT_NODES ""

RUN apk update
RUN apk upgrade
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

EXPOSE 9050 9051

RUN rm /var/cache/apk/*
ADD ./entrypoint.sh /entrypoint.sh
ADD ./torrc /tmp/torrc

RUN chmod a+w /tmp/torrc
USER tor
CMD /entrypoint.sh
