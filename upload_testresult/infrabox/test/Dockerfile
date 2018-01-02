FROM alpine:3.6

RUN apk add --no-cache python2 py2-pip && \
    pip install xmlrunner && \
    apk del py2-pip

COPY test.py /test.py
COPY infrabox/test/entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
