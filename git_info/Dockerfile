FROM debian
RUN apt-get update -y && apt-get install -y git
COPY . /my-git-repo
WORKDIR /my-git-repo
CMD /my-git-repo/entrypoint.sh
