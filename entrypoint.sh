#!/bin/sh

CONFIG=${APTLY_CONFIG:-/etc/aptly.conf}
PARAMS=${APTLY_PARAMS:-""}
VERBOSE=${ENTRYPOINT_VERBOSE:-0}

if [ $VERBOSE -eq 1 ]; then
  set -x
fi

# INITIALIZE GNUPG IF NOT EXISTS
gpg --list-keys &> /dev/null

echo " $@ " | grep '-config' &> /dev/null
if [ $0 -ne 0 ]; then
  PARAMS="-config=$CONFIG"
fi

if [ $# -eq 0 ]; then
	aptly $PARAMS serve
fi
aptly $PARAMS $@
