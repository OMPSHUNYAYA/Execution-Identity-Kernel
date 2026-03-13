#!/usr/bin/env bash
set -e

echo VERIFY_EIK

python3 eik.py examples/hello_cert.py world > /tmp/hello_world_run_1.txt
python3 eik.py examples/hello_cert.py world > /tmp/hello_world_run_2.txt

cmp -s /tmp/hello_world_run_1.txt /tmp/hello_world_run_2.txt && echo HELLO_WORLD_REPLAY: PASS || exit 1

python3 eik.py examples/plain_fib.py <<< "7" > /tmp/fib_7_run_1.txt
python3 eik.py examples/plain_fib.py <<< "7" > /tmp/fib_7_run_2.txt

cmp -s /tmp/fib_7_run_1.txt /tmp/fib_7_run_2.txt && echo FIB_7_REPLAY: PASS || exit 1

python3 eik.py examples/hello_cert.py alice > /tmp/hello_alice.txt
python3 eik.py examples/hello_cert.py bob > /tmp/hello_bob.txt

cmp -s /tmp/hello_alice.txt /tmp/hello_bob.txt && exit 1 || echo HELLO_MUTATION: PASS

python3 eik.py examples/plain_fib.py <<< "8" > /tmp/fib_8.txt

cmp -s /tmp/fib_7_run_1.txt /tmp/fib_8.txt && exit 1 || echo FIB_MUTATION: PASS

echo OVERALL_STATUS: PASS