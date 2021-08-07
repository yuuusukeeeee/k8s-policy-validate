##################
# Build stage
##################

FROM golang:1.16-alpine3.14 AS kyverno-cli

RUN apk update && \
    apk add --no-cache git make gcc musl-dev && \
    git clone https://github.com/kyverno/kyverno.git --depth 1

WORKDIR kyverno

RUN make cli && \
    mv ./cmd/cli/kubectl-kyverno/kyverno /kyverno

###################
# Packaging stage
###################

FROM alpine:3.14.0

RUN apk update && \
    apk add --no-cache git bash

COPY --from=kyverno-cli /kyverno /usr/bin/kyverno
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
