@echo off
REM Configurar página de código para UTF-8 (suporte a caracteres especiais)
chcp 65001 >nul

set TASK_NAME=Deploy_Dimep_Update1
set XML_PATH=%TEMP%\Deploy_Dimep_Update1.xml
set VBS_PATH=C:\temp\DIMEP FINAL\ExecuteSilent.vbs

:: Verifica administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Execute este script como Administrador!
    pause
    exit /b 1
)

:: Cria o XML da tarefa
(
echo ^<?xml version="1.0" encoding="UTF-16"?^>
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>
echo   ^<Triggers^>
echo     ^<SessionStateChangeTrigger^>
echo       ^<Enabled^>true^</Enabled^>
echo       ^<StateChange^>SessionUnlock^</StateChange^>
echo     ^</SessionStateChangeTrigger^>
echo   ^</Triggers^>
echo   ^<Principals^>
echo     ^<Principal id="Author"^>
echo       ^<RunLevel^>HighestAvailable^</RunLevel^>
echo       ^<LogonType^>InteractiveToken^</LogonType^>
echo     ^</Principal^>
echo   ^</Principals^>
echo   ^<Settings^>
echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^>
echo     ^<StopIfGoingOnBatteries^>false^</StopIfGoingOnBatteries^>
echo     ^<AllowHardTerminate^>false^</AllowHardTerminate^>
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^>
echo     ^<IdleSettings^>
echo       ^<StopOnIdleEnd^>false^</StopOnIdleEnd^>
echo       ^<RestartOnIdle^>false^</RestartOnIdle^>
echo     ^</IdleSettings^>
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^>
echo     ^<Enabled^>true^</Enabled^>
echo     ^<Hidden^>false^</Hidden^>
echo   ^</Settings^>
echo   ^<Actions Context="Author"^>
echo     ^<Exec^>
echo       ^<Command^>wscript.exe^</Command^>
echo       ^<Arguments^>"%VBS_PATH%"^</Arguments^>
echo     ^</Exec^>
echo   ^</Actions^>
echo ^</Task^>
) > "%XML_PATH%"

:: Cria a tarefa a partir do XML
schtasks /create /tn "%TASK_NAME%" /xml "%XML_PATH%"

if %errorlevel% equ 0 (
    echo [OK] Tarefa criada com sucesso!
) else (
    echo [ERRO] Não foi possível criar a tarefa. Talvez ela já exista.
    echo Código do erro: %errorlevel%
)

:: Apaga o XML temporário
del "%XML_PATH%" >nul 2>&1


exit /b 0
