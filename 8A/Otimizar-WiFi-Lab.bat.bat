@echo off
:: ====================================================================
:: SCRIPT DE OTIMIZACAO DE REDE WI-FI PARA LABORATORIOS (2.4 GHz)
:: Executar como ADMINISTRADOR (Clique com o botao direito -> Executar como Administrador)
:: ====================================================================

title Otimizacao de Rede Wi-Fi - Laboratorio
color 0A

:: Verifica se esta executando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo ====================================================================
    echo ERRO: Este script precisa ser executado como ADMINISTRADOR!
    echo Clique com o botao direito no arquivo .bat e selecione:
    echo "Executar como administrador"
    echo ====================================================================
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================================================
echo  INICIANDO OTIMIZACOES DE REDE WI-FI (2.4 GHz)
echo ====================================================================
echo.

:: 1. Desativar Otimizacao de Entrega do Windows Update (P2P entre PCs)
echo [1/4] Desativando P2P do Windows Update (Download entre PCs)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1
echo      -^> Concluido.

:: 2. Configurar Wi-Fi como Conexao Limitada (Metered Connection)
echo [2/4] Definindo conexao Wi-Fi como Limitada (bloqueia atualizacoes em segundo plano)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v WiFi /t REG_DWORD /d 2 /f >nul 2>&1
echo      -^> Concluido.

:: 3. Desativar Economia de Energia das Placas de Rede Wi-Fi
echo [3/4] Desativando economia de energia da placa de rede Wi-Fi...
powershell -Command "Get-NetAdapter -Physical | Where-Object { $_.MediaType -eq '802.3' -or $_.PhysicalMediaType -like '*Wireless*' -or $_.Name -like '*Wi-Fi*' -or $_.Name -like '*Wireless*' } | ForEach-Object { $pnp = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object { $_.PNPDeviceID -eq $_.PnPDeviceID }; if ($pnp) { $pm = Get-WmiObject -Class MSPower_DeviceEnable -Namespace 'root\wmi' | Where-Object { $_.InstanceName -match [regex]::Escape($pnp.DeviceID) }; if ($pm) { $pm.Enable = $false; $pm.Put() | Out-Null } } }" >nul 2>&1
echo      -^> Concluido.

:: 4. Forcar largura de canal para 20 MHz nos drivers Wi-Fi
echo [4/4] Forcando largura de canal da placa Wi-Fi para 20 MHz...
powershell -Command "Get-NetAdapter -Physical | Where-Object { $_.Name -like '*Wi-Fi*' -or $_.Name -like '*Wireless*' } | ForEach-Object { Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName '*2.4*' -DisplayValue '20MHz*' -ErrorAction SilentlyContinue; Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName '*Channel Width*' -DisplayValue '20MHz' -ErrorAction SilentlyContinue; Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName '*Bandwidth*' -DisplayValue '20MHz' -ErrorAction SilentlyContinue }" >nul 2>&1
echo      -^> Concluido.

:: 5. Limpar cache de DNS para renovar conexoes
echo.
echo Limpando cache de DNS...
ipconfig /flushdns >nul 2>&1

echo.
echo ====================================================================
echo  OTIMIZACAO CONCLUIDA COM SUCESSO!
echo  Recomenda-se reiniciar a maquina para aplicar todas as alteracoes.
echo ====================================================================
echo.
pause