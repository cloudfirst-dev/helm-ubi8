FROM registry.access.redhat.com/ubi8

ENV HELM_VERSION=3.1.1

RUN curl -O https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz

FROM registry.access.redhat.com/ubi8-minimal
COPY --from=0 linux-amd64/helm /usr/local/bin/helm
COPY entry-point.sh /usr/local/bin/entry-point.sh
USER 1001

WORKDIR /tmp

ENTRYPOINT entry-point.sh @
