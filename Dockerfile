FROM alpine

ENV KUBE_LATEST_VERSION="v1.5.3"
ENV HELM_VERSION="v2.2.0"

RUN apk add --update ca-certificates \
  && apk add --update -t deps curl \
  && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && curl -L https://kubernetes-helm.storage.googleapis.com/helm-${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm.tar.gz \
  && tar -zxvf /tmp/helm.tar.gz -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm\
  && rm -rf /tmp \
  && apk del --purge deps \
  && rm /var/cache/apk/*

ADD ./resources /

ENTRYPOINT ["/usr/local/bin/startup.sh"]