# Trabajo Practico 1 - Programacion para Seguridad Informatica
# Modulo: Programacion para Seguridad Informatica
# Docente: Lic. Carlos Pacheco
# Alumno: Franco Chavez

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " INFORMACION DEL SISTEMA - TP1 PowerShell" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Version de PowerShell
Write-Host "`n[1] VERSION DE POWERSHELL" -ForegroundColor Yellow
$PSVersionTable
Write-Host "Version detallada: $($PSVersionTable.PSVersion)" -ForegroundColor Green

# 2. Configuracion permisividad (Execution Policy)
Write-Host "`n[2] CONFIGURACION DE PERMISIVIDAD (Execution Policy)" -ForegroundColor Yellow
Get-ExecutionPolicy -List | Format-Table -AutoSize
Write-Host "Policy actual: $(Get-ExecutionPolicy)" -ForegroundColor Green

# 3. Informacion de edicion del SO
Write-Host "`n[3] EDICION DEL SISTEMA OPERATIVO" -ForegroundColor Yellow
if ($IsWindows -or $env:OS -like "*Windows*") {
    Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, WindowsEditionId, OsHardwareAbstractionLayer | Format-List
    Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, RegisteredUser | Format-List
} else {
    Write-Host "Sistema no Windows detectado, usando comandos nativos:"
    uname -a
    if (Test-Path /etc/os-release) { Get-Content /etc/os-release }
}

# 4. Complemento con simbolo del sistema para TODA la info de la PC
Write-Host "`n[4] INFORMACION COMPLETA DE LA PC (systeminfo / lshw)" -ForegroundColor Yellow
if ($IsWindows -or $env:OS -like "*Windows*") {
    systeminfo
    Write-Host "`n--- Info adicional con Get-ComputerInfo ---"
    Get-ComputerInfo | Format-List
} elseif ($IsLinux) {
    try { lshw -short } catch { Write-Host "Instalá lshw con: sudo apt install lshw" }
    Write-Host "`n--- Memoria y CPU ---"
    free -h
    lscpu | Select-Object -First 25
} elseif ($IsMacOS) {
    system_profiler SPHardwareDataType SPSoftwareDataType
}

Write-Host "`n--- Fin del reporte TP1 ---" -ForegroundColor Cyan
