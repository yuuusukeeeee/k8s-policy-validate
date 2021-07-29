FROM golang:1.15-alpine AS kyverno-cli

COPY entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk add --no-cache git make && \
    git clone https://github.com/kyverno/kyverno.git --depth 1 && \
    cd $(basename $_ .git) && \
    make cli && \
    mv ./cmd/cli/kubectl-kyverno/kyverno /usr/bin/kyverno && \
    cd $HOME && \
    rm -rf ./kyverno

ENTRYPOINT ["/entrypoint.sh"]
