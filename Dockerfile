FROM golang:1.16-alpine3.14 AS kyverno-cli

COPY entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk add --no-cache git make gcc musl-dev && \
    git clone https://github.com/kyverno/kyverno.git --depth 1

WORKDIR kyverno

RUN make cli && \
    mv ./cmd/cli/kubectl-kyverno/kyverno /usr/bin/kyverno && \
    cd $HOME && \
    rm -rf ./kyverno && \
    rm -rf ./go

ENTRYPOINT ["/entrypoint.sh"]
