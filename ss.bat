@echo off
chcp 65001 >nul
title CS2 Auto-Config & Launch

:: --- НАСТРОЙКИ ---
:: Вставь сюда свою прямую ссылку (Raw) из GitHub:
set "URL_CFG=https://raw.githubusercontent.com/zxc011066/-css/refs/heads/main/autoexec.cfg"

:: Пути к игре и ренталу (проверь диск, обычно F: в клубах)
set "GAME_CFG_DIR=F:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "RENTAL_EXE=C:\RentalGames\RentalGames.exe"

echo [*] Старт подготовки...

:: 1. Проверка папки (создаем, если её нет)
if not exist "%GAME_CFG_DIR%" (
    echo [!] Папка конфигов не найдена, пробую создать...
    mkdir "%GAME_CFG_DIR%" 2>nul
)

:: 2. Скачивание конфига (заменяет существующий)
echo [*] Скачиваю конфиг из GitHub: %URL_CFG%
curl -L -s -o "%GAME_CFG_DIR%\autoexec.cfg" "%URL_CFG%"

if %errorlevel% equ 0 (
    echo [+] Конфиг успешно обновлен в %GAME_CFG_DIR%
) else (
    echo [!] Ошибка скачивания! Проверь интернет или ссылку.
    pause
    exit /b
)

:: 3. Запуск игры через Rental
echo [*] Запускаю Rental (CS2)...
start "" "%RENTAL_EXE%" -autostart -noselect -asynchron_check -idgame 730

:: 4. Костыль для окна Steam Cloud
echo [*] Жду 12 секунд для пробития окна Cloud...
timeout /t 12 /nobreak >nul
powershell -command "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys(' ')"

echo [+] Готово! Игра должна подхватить средние настройки.
pause