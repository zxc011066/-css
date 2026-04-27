@echo off
:: Нам не нужно качать файл, мы передадим настройки прямо в строке запуска
set "SETTINGS=+setting.cpu_level 1 +setting.gpu_mem_level 1 +setting.gpu_level 1 +setting.model_detail 1 +setting.msaa_samples 4 +fps_max 0 +con_enable 1"

echo [*] Запускаю игру с принудительными средними настройками...

:: Запускаем рентал и прокидываем настройки через аргумент -gameparam
:: В некоторых ренталах это работает через -args или просто добавление команд в конце
start "" "C:\RentalGames\RentalGames.exe" -autostart -idgame 730 -args "%SETTINGS%"

timeout /t 12 /nobreak >nul
powershell -command "$ws = New-Object -ComObject WScript.Shell; $ws.SendKeys(' ')"
