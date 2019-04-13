#!/bin/bash

if [ -x "/ssh-keys" ]; then
    mkdir -p /root/.ssh
    cp /ssh-keys/* /root/.ssh
    chmod 0700 /root/.ssh
    chmod 0600 /root/.ssh/*
fi

"$@"
