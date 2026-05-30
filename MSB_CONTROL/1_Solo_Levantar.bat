@echo off
title [DEV] Levantar MSB Shop
color 0B

echo ==========================================
echo    LEVANTANDO ENTORNO DE DESARROLLO
echo ==========================================
echo.

:: Levantar Backend
start "BACKEND" cmd /k "cd /d C:\wamp64\www\mbs_backend && npm run dev"

:: Pausa de 2 segundos
timeout /t 2 >nul

:: Levantar Frontend
start "FRONTEND" cmd /k "cd /d C:\wamp64\www\mbs_frontend && npm run dev"

echo.
echo [+] Servicios iniciados desde C:\wamp64\www\
echo.