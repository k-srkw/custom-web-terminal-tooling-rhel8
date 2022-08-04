FROM registry.redhat.io/web-terminal/web-terminal-tooling-rhel8:1.5
USER 0

RUN microdnf install -y \
    # install envsubst, tar, htpasswd, ...
    gettext tar httpd-tools && \
    microdnf -y clean all

COPY /etc/initial_config /tmp/initial_config
COPY /etc/dsc /opt/dsc

RUN \
    COMPDIR=$(pkg-config --variable=completionsdir bash-completion) && \
    # install dsc
    ln -s /opt/dsc/bin/dsc /usr/local/bin/dsc && \
    dsc autocomplete bash && \
    printf "eval $(dsc autocomplete:script bash)" > $COMPDIR/dsc

# Change permissions to let any arbitrary user
RUN for f in "${HOME}" "${INITIAL_CONFIG}" "/etc/passwd" "/etc/group"; do \
    echo "Changing permissions on ${f}" && chgrp -R 0 ${f} && \
    chmod -R g+rwX ${f}; \
    done

USER 1001

