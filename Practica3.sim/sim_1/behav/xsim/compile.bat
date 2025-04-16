@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.1.1 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Wed Apr 16 13:40:18 +0200 2025
REM SW Build 3900603 on Fri Jun 16 19:31:24 MDT 2023
REM
REM IP Build 3900379 on Sat Jun 17 05:28:05 MDT 2023
REM
REM usage: compile.bat
REM
REM ****************************************************************************
REM compile VHDL design sources
echo "xvhdl --incr --relax -prj tb_redundancia_vhdl.prj"
call xvhdl  --incr --relax -prj tb_redundancia_vhdl.prj -log xvhdl.log
call type xvhdl.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
