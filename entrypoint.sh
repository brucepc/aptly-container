#!/bin/sh

if [ $# -eq 0 ]; then
	aptly serve
fi
aptly $@
