FROM golang:1.15

COPY entrypoint.sh /entrypoint.sh

RUN git clone https://github.com/kyverno/kyverno.git
WORKDIR kyverno
RUN make cli
RUN mv ./cmd/cli/kubectl-kyverno/kyverno /usr/bin/kyverno

ENTRYPOINT ["/entrypoint.sh"]
