#! /bin/bash

if [ -z "$@" ]; then
	exec /src/bless/v1p02/bless
else
	exec /src/bless/v1p02/bless "$@"
fi
