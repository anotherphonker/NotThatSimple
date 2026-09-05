::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFClRXxGOAE+1EbsQ5+n//Naoi31QBrtnKtqJg+baea4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFClRXxGOAE+/Fb4I5/jHweWTlkUcQNE2dZ/X3/qLOOVz
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal

set "EXE=C:\Users\Resul\AppData\Local\Microsoft\WindowsApps\simpmusic.exe"

start "" "%EXE%"

powershell -NoProfile -Command ^
  "$proc = $null; for ($i=0; $i -lt 150; $i++) { Start-Sleep -Milliseconds 200; $proc = Get-Process -Name SimpMusic -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1; if ($proc) { break } };" ^
  "if ($proc) {" ^
  "  Add-Type -Name Win32 -Namespace W -MemberDefinition '[DllImport(\"user32.dll\")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")] public static extern bool SetForegroundWindow(IntPtr hWnd);';" ^
  "  [W.Win32]::ShowWindowAsync($proc.MainWindowHandle, 6)  | Out-Null;" ^
  "  Start-Sleep -Milliseconds 150;" ^
  "  [W.Win32]::ShowWindowAsync($proc.MainWindowHandle, 3)  | Out-Null;" ^
  "  [W.Win32]::SetForegroundWindow($proc.MainWindowHandle) | Out-Null" ^
  "} else { Write-Output 'Pencere bulunamadi, timeout.' }"

endlocal