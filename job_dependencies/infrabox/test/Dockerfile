FROM alpine:3.4

RUN apk add --no-cache gtest g++

COPY . job_dependencies

# just to make sure we can also run it with docker on windows
RUN dos2unix job_dependencies/infrabox/test/entrypoint.sh
RUN chmod +x job_dependencies/infrabox/test/entrypoint.sh

CMD ["/job_dependencies/infrabox/test/entrypoint.sh"]
