FROM alpine:3.4

RUN apk add --no-cache gtest gtest-dev g++ cmake make

# Compile gtest, used for out c++ tests
RUN cd /usr/src/gtest/ && \
    cmake . && \
    make && \
    cp *.a /usr/lib

COPY . simple_project

# just to make sure we can also run it with docker on windows
RUN dos2unix /simple_project/infrabox/build-and-test/entrypoint.sh
RUN chmod +x /simple_project/infrabox/build-and-test/entrypoint.sh

CMD ["simple_project/infrabox/build-and-test/entrypoint.sh"]
