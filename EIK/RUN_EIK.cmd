@echo off
setlocal
if not exist outputs_example mkdir outputs_example
python eik.py examples\hello_cert.py -- World > outputs_example\hello_world_run_1.txt
type outputs_example\hello_world_run_1.txt
endlocal