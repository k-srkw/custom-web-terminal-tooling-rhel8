FROM registry.redhat.io/web-terminal-tech-preview/web-terminal-tooling-rhel8:1.4
USER 0

RUN microdnf install -y \
    # install envsubst
    gettext && \
    microdnf -y clean all

USER 1001

