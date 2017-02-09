FROM alpine:3.4

RUN apk add --no-cache python py-requests py-pip
RUN pip install nose

COPY . project

CMD ["project/infrabox/test/entrypoint.sh"]
