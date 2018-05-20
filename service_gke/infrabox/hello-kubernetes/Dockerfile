FROM ubuntu

RUN apt-get update -y && apt-get install -y curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.7.0-linux-amd64.tar.gz && \
    tar xvf helm-v2.7.0-linux-amd64.tar.gz && \
    mv ./linux-amd64/helm /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm helm-v2.7.0-linux-amd64.tar.gz

CMD /infrabox/context/infrabox/hello-kubernetes/entrypoint.sh
