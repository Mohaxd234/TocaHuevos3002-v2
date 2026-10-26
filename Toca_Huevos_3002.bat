@echo off
title Enviar mensaje MSG
cls

:INICIO
echo.
echo ==================
echo.
echo  Menu de Envios
echo.
echo ==================
echo.
echo Elige un destinatario o escribe 0 para IP manual:
echo.
echo  1. Corvo           (172.20.5.132)
echo  2. Mohamed         (172.20.5.111)
echo  3. Alessandro      (172.20.5.131)
echo  4. Roman           (172.20.5.121)
echo  5. AsierDAI        (172.20.5.122)
echo  6. Marius          (172.20.5.135)
echo  7. AsierI          (172.20.5.134)
echo  8. Kristian        (172.20.5.144)
echo  9. Hugo            (172.20.5.141)
echo  10. Julen          (172.20.5.123)
echo  11. Yussef         (172.20.5.113)
echo  0. Introducir IP manualmente
echo.

set /p OPCION="Tu eleccion: "
echo.

set "IP="
set "ALIAS="

if "%OPCION%"=="1"  set "IP=172.20.5.132" & set "ALIAS=Corvo"
if "%OPCION%"=="2"  set "IP=172.20.5.111" & set "ALIAS=Mohamed"
if "%OPCION%"=="3"  set "IP=172.20.5.131" & set "ALIAS=Alessandro"
if "%OPCION%"=="4"  set "IP=172.20.5.121" & set "ALIAS=Roman"
if "%OPCION%"=="5"  set "IP=172.20.5.122" & set "ALIAS=AsierDAI"
if "%OPCION%"=="6"  set "IP=172.20.5.135" & set "ALIAS=Marius"
if "%OPCION%"=="7"  set "IP=172.20.5.134" & set "ALIAS=AsierI"
if "%OPCION%"=="8"  set "IP=172.20.5.144" & set "ALIAS=Kristian"
if "%OPCION%"=="9"  set "IP=172.20.5.141" & set "ALIAS=Hugo"
if "%OPCION%"=="10" set "IP=172.20.5.123" & set "ALIAS=Julen"
if "%OPCION%"=="11" set "IP=172.20.5.113" & set "ALIAS=Yussef"

if "%OPCION%"=="0" (
    set /p IP="Introduce la IP manualmente: "
    set /p ALIAS="Nombre para mostrar (opcional): "
)

if "%IP%"=="" (
    echo Opcion no valida. Volviendo al menu...
    timeout /t 2 /nobreak >nul
    cls
    goto INICIO
)

if "%ALIAS%"=="" set "ALIAS=%IP%"

set /p TEXTO="Escribe el mensaje: "
echo.
set /p CANTIDAD="Cuantas veces quieres enviarlo?: "
echo.

echo --------------------------------------------
echo  Destinatario: %ALIAS%
echo  IP:           %IP%
echo  Mensaje:      %TEXTO%
echo  Veces:        %CANTIDAD%
echo --------------------------------------------
echo.

set /p CONFIRM="Confirmas el envio? (S/N): "
if /I "%CONFIRM%" NEQ "S" (
    echo Envio cancelado. Volviendo al menu...
    timeout /t 2 /nobreak >nul
    cls
    goto INICIO
)

echo.
echo Enviando mensajes...
for /L %%i in (1,1,%CANTIDAD%) do (
    msg * /server:%IP% "%TEXTO%" >nul 2>&1
)

echo.
echo ¡Proceso finalizado!
timeout /t 3 /nobreak >nul
cls
goto INICIO

echo.
echo Hasta luego!
pause
exit
