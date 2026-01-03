@echo off
echo "Clean temporary files"
rd /s /q .Xil
rd /s /q task2.cache
rd /s /q task2.sim
rd /s /q task2.runs
rd /s /q task2.hw
del /s /q "*.jou"
del /s /q "*.log"
del /s /q "*.str"
echo "Clean completed."
