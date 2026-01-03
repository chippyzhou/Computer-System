@echo off
echo "Clean temporary files"
rd /s /q .Xil
rd /s /q task4.cache
rd /s /q task4.sim
rd /s /q task4.runs
rd /s /q task4.hw
del /s /q "*.jou"
del /s /q "*.log"
del /s /q "*.str"
echo "Clean completed."
