@echo off
echo "Clean temporary files"
rd /s /q .Xil
rd /s /q task1.cache
rd /s /q task1.sim
rd /s /q task1.runs
rd /s /q task1.hw
del /s /q "*.jou"
del /s /q "*.log"
del /s /q "*.str"
echo "Clean completed."
