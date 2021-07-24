FROM alpine

ARG http_proxy
ARG https_proxy

RUN wget -c https://github.com/open-policy-agent/conftest/releases/download/v0.25.0/conftest_0.25.0_Linux_x86_64.tar.gz -O - | tar -xz

USER 1001
ENTRYPOINT ["/conftest"]
CMD ["--help"]