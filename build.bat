@if (@CodeSection == @Batch) @then
@echo off

for %%X in (love.exe) do (set love=%%~$PATH:X)
copy %love% love.exe

set SendKeys=CScript //nologo //E:JScript "%~F0"
start "" /B lovedist.exe love-controller love-controller -e
start "" /B lovedist.exe love-dodger love-dodger -e
start "" /B lovedist.exe love-hello love-hello -e
start "" /B lovedist.exe love-tictactoe love-tictactoe -e
start "" /B lovedist.exe love-memory love-memory -e
start "" /B lovedist.exe love-slider love-slider -e
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"

goto :EOF
@end

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));