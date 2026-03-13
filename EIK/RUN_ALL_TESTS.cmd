@echo off
setlocal

if not exist outputs_example mkdir outputs_example

echo RUNNING_EIK_TESTS

python eik.py examples\hello_cert.py -- World > outputs_example\hello_world_run_1.txt
python eik.py examples\hello_cert.py -- World > outputs_example\hello_world_run_2.txt
python eik.py examples\hello_cert.py -- Alice > outputs_example\hello_alice.txt
python eik.py examples\hello_cert.py -- Bob > outputs_example\hello_bob.txt

python eik.py examples\plain_fib.py --line 7 > outputs_example\fib_7_run_1.txt
python eik.py examples\plain_fib.py --line 7 > outputs_example\fib_7_run_2.txt
python eik.py examples\plain_fib.py --line 8 > outputs_example\fib_8.txt

python eik.py examples\sum_cert.py -- 5 9 > outputs_example\sum_5_9.txt
python eik.py examples\plain_copy_upper.py -- examples\note.txt > outputs_example\note_upper.txt

call VERIFY_EIK.cmd
if errorlevel 1 exit /b 1

echo ALL_TESTS_COMPLETE
endlocal