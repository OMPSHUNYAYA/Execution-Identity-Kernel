@echo off
setlocal

echo VERIFY_EIK

fc /b outputs_example\hello_world_run_1.txt outputs_example\hello_world_run_2.txt >nul
if errorlevel 1 (
  echo HELLO_WORLD_REPLAY: FAIL
  exit /b 1
) else (
  echo HELLO_WORLD_REPLAY: PASS
)

fc /b outputs_example\fib_7_run_1.txt outputs_example\fib_7_run_2.txt >nul
if errorlevel 1 (
  echo FIB_7_REPLAY: FAIL
  exit /b 1
) else (
  echo FIB_7_REPLAY: PASS
)

fc /b outputs_example\hello_alice.txt outputs_example\hello_bob.txt >nul
if errorlevel 1 (
  echo HELLO_MUTATION: PASS
) else (
  echo HELLO_MUTATION: FAIL
  exit /b 1
)

fc /b outputs_example\fib_7_run_1.txt outputs_example\fib_8.txt >nul
if errorlevel 1 (
  echo FIB_MUTATION: PASS
) else (
  echo FIB_MUTATION: FAIL
  exit /b 1
)

echo OVERALL_STATUS: PASS
endlocal