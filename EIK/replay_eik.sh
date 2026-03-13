#!/usr/bin/env bash
set -e

python3 eik.py examples/hello_cert.py world > /tmp/eik_run1.txt
python3 eik.py examples/hello_cert.py world > /tmp/eik_run2.txt

cmp -s /tmp/eik_run1.txt /tmp/eik_run2.txt && echo HELLO_WORLD_REPLAY: PASS || exit 1