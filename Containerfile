FROM registry.redhat.io/web-terminal/web-terminal-tooling-rhel8:1.5
USER 0

RUN microdnf install -y \
    # install envsubst
    gettext && \
    microdnf -y clean all

USER 1001
