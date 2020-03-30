FROM registry.access.redhat.com/ubi8

ENV HELM_VERSION=3.1.2

RUN curl -O https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    rm helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    yum install -y git && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

COPY entry-point.sh /usr/local/bin/entry-point.sh
RUN helm plugin install https://github.com/thomastaylor312/helm-namespace
USER 1001

WORKDIR /tmp

ENTRYPOINT entry-point.sh $@
