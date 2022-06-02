FROM registry.redhat.io/web-terminal/web-terminal-tooling-rhel8:1.5
USER 0

RUN microdnf install -y \
    # install envsubst and tar
    gettext tar && \
    microdnf -y clean all

COPY /etc/initial_config /tmp/initial_config
COPY /etc/crwctl /opt/crwctl

RUN \
    COMPDIR=$(pkg-config --variable=completionsdir bash-completion) && \
    # install crwctl
    ln -s /opt/crwctl/bin/crwctl /usr/local/bin/crwctl && \
    crwctl autocomplete bash && \
    printf "eval $(crwctl autocomplete:script bash)" > $COMPDIR/crwctl

# Change permissions to let any arbitrary user
RUN for f in "${HOME}" "${INITIAL_CONFIG}" "/etc/passwd" "/etc/group"; do \
    echo "Changing permissions on ${f}" && chgrp -R 0 ${f} && \
    chmod -R g+rwX ${f}; \
    done

USER 1001

