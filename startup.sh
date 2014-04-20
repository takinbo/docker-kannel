#!/bin/bash
# In order to provide SSH access check the AUTHORIZED_KEYS
# environment variable
if [ -n "$AUTHORIZED_KEYS" ]; then
    mkdir -p /root/.ssh && chmod 0700 /root/.ssh
    echo "$AUTHORIZED_KEYS" > /root/.ssh/authorized_keys && chmod 0600 /root/.ssh/authorized_keys
fi
supervisord -n
