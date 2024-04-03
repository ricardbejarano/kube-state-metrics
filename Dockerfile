FROM golang:1-alpine AS build

ARG VERSION="2.12.0"
ARG CHECKSUM="b88cfecfec98e179cea6228ef625a272d91764fe025e793a71741dcc27c7596f"

ADD https://github.com/kubernetes/kube-state-metrics/archive/v$VERSION.tar.gz /tmp/kube-state-metrics.tar.gz

RUN [ "$(sha256sum /tmp/kube-state-metrics.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add git && \
    tar -C /tmp -xf /tmp/kube-state-metrics.tar.gz && \
    mkdir -p /go/src/github.com/kubernetes && \
    mv /tmp/kube-state-metrics-$VERSION /go/src/github.com/kubernetes/kube-state-metrics && \
    cd /go/src/github.com/kubernetes/kube-state-metrics && \
      CGO_ENABLED=0 go install

RUN mkdir -p /rootfs/bin && \
      cp /go/bin/kube-state-metrics /rootfs/bin/ && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
EXPOSE 8080/tcp 8081/tcp
ENTRYPOINT ["/bin/kube-state-metrics"]
CMD ["--port=8080", "--telemetry-port=8081"]
