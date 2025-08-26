@echo off

REM Configurar página de código para UTF-8 (suporte a caracteres especiais)
chcp 65001 >nul

title ATUALIZAÇÃO KAIROS DIMEP DESKTOP 2.5.0
REM ===========================================================================
REM SCRIPT DE ATUALIZAÇÃO DO KAIROS DESKTOP DIMEP 2.5.0
REM Autor: Eduardo Grigorio (71)98800-3296
REM Data: 22/08/2025
REM Versão: 2.5.0
REM 
REM Propósito: Automatizar a instalação/atualização do software Kairos Desktop
REM            versão 2.5.0, incluindo remoção de versões anteriores, cópia de
REM            arquivos necessários e registro de log de instalação.
REM ===========================================================================


REM Habilitar expansão atrasada de variáveis para manipulação dinâmica
setlocal enabledelayedexpansion



REM ---------------------------------------------------------------------------
REM INÍCIO DO SCRIPT - VERIFICAÇÃO DE INSTALAÇÃO EXISTENTE
REM ---------------------------------------------------------------------------
:INICIO
::echo Verificando se versao 2.5.0 ja esta instalada... >> "!LOG_FULL!"
REM Verificar se a versão 2.5.0 já está instalada através do arquivo de marcação
if exist "C:\Program Files (x86)\PontoDesk\Kairos Desktop\sys_dimep_inst_2.5.0.sys" (
    REM Se o arquivo de marcação existe, exibir mensagem e finalizar
    ::echo [%TIME%] VERSAO 2.5.0 JA INSTALADA - Finalizando script. >> "!LOG_FULL!"
    ::msg * "Nova versão DIMEP 2.5.0 já instalada!" >nul
    goto FIM
) else (
    REM Se não existe, informar usuário sobre a atualização
    ::echo [%TIME%] Iniciando atualizacao para versao 2.5.0... >> "!LOG_FULL!"
    ::msg * "Atualizando dispositivo com a nova versão DIMEP 2.5.0!" >nul
)

REM ---------------------------------------------------------------------------
REM CONFIGURAÇÃO DE LOG - ARQUIVO ÚNICO POR EXECUÇÃO
REM ---------------------------------------------------------------------------
set "LOG_DIR=\\credcesta.local\NETLOGON\DomainShareTI\Dimep\LOG"
set "LOG_FILE=%USERNAME%_%COMPUTERNAME%_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "LOG_FULL=%LOG_DIR%\!LOG_FILE!"

:: Capturar IP Público
for /f %%i in ('curl -s ifconfig.io') do set "IP_PUBLICO=%%i"

:: Capturar IP Local (primeiro IPv4 encontrado)
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do (
    set "IP_LOCAL=%%a"
    goto :after_ip
)
:after_ip
:: Remover espaços em branco do IP Local
set "IP_LOCAL=%IP_LOCAL: =%"


REM Criar cabeçalho do log
echo ========================================================== >> "!LOG_FULL!"
echo SCRIPT DE INSTALACAO KAIROS DESKTOP 2.5.0                >> "!LOG_FULL!"
echo INICIADO: %DATE% %TIME%                                  >> "!LOG_FULL!"
echo USUARIO: %USERDOMAIN%\%USERNAME%                         >> "!LOG_FULL!"
echo COMPUTADOR: %COMPUTERNAME%                               >> "!LOG_FULL!"
echo IP local: %IP_LOCAL%                                     >> "!LOG_FULL!"
echo IP Público:  %IP_PUBLICO%                                >> "!LOG_FULL!"
echo ========================================================== >> "!LOG_FULL!"
echo. >> "!LOG_FULL!"


REM ---------------------------------------------------------------------------
REM SINCRONIZAÇÃO DO ARQUIVO EXECUTÁVEL CORRIGIDO
REM ---------------------------------------------------------------------------
:SYNC_ARQUIVO_EXE
echo [%TIME%] Verificando arquivo executavel corrigido... >> "!LOG_FULL!"
REM Verificar se o arquivo executável corrigido já existe na pasta temporária
if exist "C:\temp\Kairos Desktop.exe" (
    REM Arquivo já existe, prosseguir sem ação
    echo [%TIME%] Arquivo executavel ja existe em C:\temp\ >> "!LOG_FULL!"
    rem
) else (
    echo [%TIME%] Arquivo executavel nao encontrado. Iniciando copia... >> "!LOG_FULL!"
    REM Se não existe, criar diretório temp se necessário e copiar arquivo
    if not exist "C:\temp" (
        echo [%TIME%] Criando diretorio C:\temp\ >> "!LOG_FULL!"
        mkdir "C:\temp" >nul 2>&1
    )
    REM Copiar executável corrigido do servidor para máquina local
    echo [%TIME%] Copiando arquivo do servidor... >> "!LOG_FULL!"
    copy /y "\\credcesta.local\NETLOGON\DomainShareTI\Kairos Desktop.exe" "C:\temp\Kairos Desktop.exe" >nul 2>&1
    REM Verificar se cópia foi bem sucedida
    if exist "C:\temp\Kairos Desktop.exe" (
        echo [%TIME%] Arquivo executavel copiado com sucesso >> "!LOG_FULL!"
    ) else (
        echo [%TIME%] ERRO: Falha ao copiar arquivo executavel >> "!LOG_FULL!"
        REM Se falhou, finalizar script
        goto FIM
    )
)

REM ---------------------------------------------------------------------------
REM SINCRONIZAÇÃO DO INSTALADOR MSI
REM ---------------------------------------------------------------------------
:SYNC_ARQUIVO_MSI
echo [%TIME%] Verificando instalador MSI... >> "!LOG_FULL!"
REM Verificar se o instalador MSI já existe na pasta temporária
if exist "C:\temp\IntaladorDimep2.5.0.msi" (
    REM Instalador já existe, prosseguir sem ação
    echo [%TIME%] Instalador MSI ja existe em C:\temp\ >> "!LOG_FULL!"
    rem
) else (
    echo [%TIME%] Instalador MSI nao encontrado. Iniciando copia... >> "!LOG_FULL!"
    REM Copiar instalador MSI do servidor para máquina local
    copy /y "\\credcesta.local\NETLOGON\DomainShareTI\IntaladorDimep2.5.0.msi" "C:\temp\IntaladorDimep2.5.0.msi" >nul 2>&1
    REM Verificar se cópia foi bem sucedida
    if exist "C:\temp\IntaladorDimep2.5.0.msi" (
        echo [%TIME%] Instalador MSI copiado com sucesso >> "!LOG_FULL!"
    ) else (
        echo [%TIME%] ERRO: Falha ao copiar instalador MSI >> "!LOG_FULL!"
        REM Se falhou, finalizar script
        goto FIM
    )
)

REM ---------------------------------------------------------------------------
REM REMOÇÃO DA VERSÃO ANTERIOR DO SOFTWARE
REM ---------------------------------------------------------------------------
:REMOVE_APP
echo [%TIME%] Iniciando remocao da versao anterior... >> "!LOG_FULL!"

REM Forçar encerramento de processos do Kairos em execução
echo [%TIME%] Encerrando processos Kairos... >> "!LOG_FULL!"
taskkill /f /im "Kairos Desktop.exe" >nul 2>&1
taskkill /f /im "KairosDesktop.exe" >nul 2>&1
REM Usar PowerShell para garantir que todos os processos relacionados sejam fechados
powershell -Command "Stop-Process -Name '*Kairos*' -Force -ErrorAction SilentlyContinue" >nul 2>&1
REM Aguardar 2 segundos para garantir que processos sejam finalizados
timeout /t 2 /nobreak >nul

echo [%TIME%] Removendo chave de registro... >> "!LOG_FULL!"
REM Remover chave de registro do desinstalador para evitar conflitos
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Kairos Desktop" /f >nul 2>&1

REM Remover pasta de instalação anterior se existir
if exist "C:\Program Files (x86)\PontoDesk" (
    echo [%TIME%] Removendo pasta de instalacao anterior... >> "!LOG_FULL!"
    REM Tentar remover pasta recursivamente
    rmdir /s /q "C:\Program Files (x86)\PontoDesk" 2>nul
    REM Se falhar, chamar procedimento para tomar posse e remover
    if exist "C:\Program Files (x86)\PontoDesk" (
        echo [%TIME%] Falha na remocao. Executando takeown... >> "!LOG_FULL!"
        call :TakeOwnershipAndDelete
    ) else (
        echo [%TIME%] Pasta removida com sucesso >> "!LOG_FULL!"
    )
) else (
    echo [%TIME%] Pasta de instalacao anterior nao encontrada >> "!LOG_FULL!"
)

echo [%TIME%] Removendo atalhos da area de trabalho... >> "!LOG_FULL!"
REM Remover atalhos da área de trabalho (usuário atual e área de trabalho pública)
del /f /q "C:\Users\%username%\Desktop\Kairos Desktop.lnk" 2>nul
del /f /q "C:\Users\Public\Desktop\Kairos Desktop.lnk" 2>nul
del /f /q "C:\Users\%username%\Desktop\kairos dimep.lnk" 2>nul
del /f /q "C:\Users\%username%\Desktop\Kairos*.lnk" 2>nul
del /f /q "C:\Users\Public\Desktop\Kairos*.lnk" 2>nul

echo [%TIME%] Desinstalando versoes anteriores via MSI... >> "!LOG_FULL!"
REM Desinstalar versões anteriores via Windows Installer (MSI)
set "MSI_COUNT=0"
for /f "skip=2 tokens=1" %%a in ('wmic product where "name like '%%Kairos%%'" get IdentifyingNumber 2^>nul') do (
    if not "%%a"=="" (
        set /a MSI_COUNT+=1
        echo [%TIME%] Desinstalando produto MSI: %%a >> "!LOG_FULL!"
        REM Executar desinstalação silenciosa de cada produto encontrado
        msiexec /x %%a /qn /norestart >nul 2>&1
    )
)
if !MSI_COUNT! EQU 0 (
    echo [%TIME%] Nenhum produto MSI encontrado para desinstalacao >> "!LOG_FULL!"
) else (
    echo [%TIME%] Total de !MSI_COUNT! produtos MSI desinstalados >> "!LOG_FULL!"
)

REM ---------------------------------------------------------------------------
REM INSTALAÇÃO DA NOVA VERSÃO 2.5.0
REM ---------------------------------------------------------------------------
:INSTALACAO
echo [%TIME%] Iniciando instalacao da nova versao 2.5.0... >> "!LOG_FULL!"
REM Verificar se o instalador MSI está disponível
if exist "C:\Temp\IntaladorDimep2.5.0.msi" (
    echo [%TIME%] Executando instalacao silenciosa do MSI... >> "!LOG_FULL!"
    REM Executar instalação silenciosa do MSI
    msiexec /i "C:\Temp\IntaladorDimep2.5.0.msi" /qn >nul 2>&1
    
    echo [%TIME%] Instalacao MSI concluida. Aguardando 30 segundos... >> "!LOG_FULL!"
    REM Aguardar 30 segundos para conclusão da instalação
    timeout /t 30 /nobreak >nul
    
    REM Verificar se existe o executável corrigido para cópia
    if exist "C:\Temp\Kairos Desktop.exe" (
        echo [%TIME%] Copiando arquivo executavel corrigido... >> "!LOG_FULL!"
        REM Criar diretório de destino se não existir
        if not exist "C:\Program Files (x86)\PontoDesk\Kairos Desktop\" (
            echo [%TIME%] Criando diretorio de instalacao... >> "!LOG_FULL!"
            mkdir "C:\Program Files (x86)\PontoDesk\Kairos Desktop\" >nul 2>&1
        )
        REM Copiar executável corrigido para pasta de instalação
        copy /y "C:\Temp\Kairos Desktop.exe" "C:\Program Files (x86)\PontoDesk\Kairos Desktop\Kairos Desktop.exe" >nul 2>&1
        
        REM Criar arquivo de marcação para indicar instalação bem-sucedida
        echo. > "C:\Program Files (x86)\PontoDesk\Kairos Desktop\sys_dimep_inst_2.5.0.sys" 2>nul
        echo [%TIME%] Arquivo de marcacao criado. Instalacao concluida com sucesso! >> "!LOG_FULL!"
    ) else (
        echo [%TIME%] AVISO: Arquivo executavel corrigido nao encontrado para copia >> "!LOG_FULL!"
    )
) else (
    echo [%TIME%] ERRO: Instalador MSI nao encontrado em C:\Temp\ >> "!LOG_FULL!"
)

REM ---------------------------------------------------------------------------
REM FINALIZAR SCRIPT
REM ---------------------------------------------------------------------------
goto FIM

REM ---------------------------------------------------------------------------
REM PROCEDIMENTO: TOMAR POSSE E REMOVER PASTA (para casos de permissões)
REM ---------------------------------------------------------------------------
:TakeOwnershipAndDelete
echo [%TIME%] Executando takeown na pasta PontoDesk... >> "!LOG_FULL!"
REM Tomar posse da pasta e todos seus arquivos/subpastas
takeown /f "C:\Program Files (x86)\PontoDesk" /r /d y >nul 2>&1
REM Conceder permissões completas para administradores
icacls "C:\Program Files (x86)\PontoDesk" /grant Administradores:F /t >nul 2>&1
REM Remover pasta recursivamente
rmdir /s /q "C:\Program Files (x86)\PontoDesk" >nul 2>&1

if exist "C:\Program Files (x86)\PontoDesk" (
    echo [%TIME%] ERRO: Nao foi possivel remover a pasta apos takeown >> "!LOG_FULL!"
) else (
    echo [%TIME%] Pasta removida com sucesso apos takeown >> "!LOG_FULL!"
)
goto :eof

REM ---------------------------------------------------------------------------
REM FIM DO SCRIPT - REGISTRAR CONCLUSÃO NO LOG
REM ---------------------------------------------------------------------------
:FIM
echo. >> "!LOG_FULL!"
echo ========================================================== >> "!LOG_FULL!"
echo [%TIME%] SCRIPT FINALIZADO >> "!LOG_FULL!"
echo ========================================================== >> "!LOG_FULL!"

REM Finalizar script com código de saída 0 (sucesso)
exit /b 0

REM ===========================================================================
REM FIM DO SCRIPT DE ATUALIZAÇÃO
REM ===========================================================================