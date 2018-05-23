#! /bin/bash


if [ -z "$@" ]; then
	exec /src/bless/v1p02/bless
else
	if [ "$1" == "/bin/bash" ]
	then
		echo -e "call bless via '/src/bless/v2p01/bless'"
		/bin/bash -c bash
	else
		exec /src/bless/v1p02/bless "$@"
	fi
fi
