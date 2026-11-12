#!/bin/sh
# Point apt at Ubuntu mirrors outside the ubuntu.com DNS zone: archive.ubuntu.com,
# security.ubuntu.com, ports.ubuntu.com and azure.archive.ubuntu.com stopped
# resolving on the GitHub runners, which broke every `apt-get update` on Ubuntu.
# Same archive content, different host; a no-op for non-Ubuntu sources.
for f in /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources /etc/apt/apt-mirrors.txt; do
    if [ -f "$f" ]; then
        sed -i -E \
            -e 's#https?://ports\.ubuntu\.com/ubuntu-ports#http://mirrors.ocf.berkeley.edu/ubuntu-ports#g' \
            -e 's#https?://([a-z0-9-]+\.)*(archive|security)\.ubuntu\.com/ubuntu#http://mirrors.edge.kernel.org/ubuntu#g' \
            "$f"
    fi
done
