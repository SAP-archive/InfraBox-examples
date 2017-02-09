FROM alpine:3.4

RUN apk add --no-cache gtest gtest-dev g++ cmake make

RUN cd /usr/src/gtest/ && \
    cmake . && \
    make && \
    cp *.a /usr/lib

COPY . job_dependencies

# just to make sure we can also run it with docker on windows
RUN dos2unix job_dependencies/infrabox/build/entrypoint.sh
RUN chmod +x job_dependencies/infrabox/build/entrypoint.sh

CMD ["job_dependencies/infrabox/build/entrypoint.sh"]
