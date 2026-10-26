
    Trabajo Practico 1 - PowerShell
    Alumno: Franco Chavez
    Equipo: franco-HP-Laptop-15-fc0xxx
    SO: Linux Mint 22.3
    PowerShell: 7.6.8 Core
    Fecha: 26/10/2026
#>

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " TRABAJO PRACTICO 1 - PowerShell" -ForegroundColor Cyan
Write-Host " Alumno: Franco Chavez" -ForegroundColor White
Write-Host " Equipo: franco-HP-Laptop-15-fc0xxx" -ForegroundColor White
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

# 1) VERSION DE POWERSHELL
Write-Host "[1] VERSION DE POWERSHELL INSTALADA" -ForegroundColor Yellow
$PSVersionTable
Write-Host ""
Write-Host ">> Resultado de tu equipo: PowerShell 7.6.8 - PSEdition Core - Platform Unix" -ForegroundColor Green
Write-Host ""

# 2) CONFIGURACION DE PERMISIVIDAD
Write-Host "[2] CONFIGURACION DE PERMISIVIDAD (ExecutionPolicy)" -ForegroundColor Yellow
Get-ExecutionPolicy -List | Format-Table -AutoSize
Write-Host ">> Resultado de tu equipo: Unrestricted en todos los Scopes (MachinePolicy, UserPolicy, Process, CurrentUser, LocalMachine)" -ForegroundColor Green
Write-Host ""

# 3) INFORMACION DE LA EDICION DEL SISTEMA OPERATIVO
Write-Host "[3] INFORMACION DE LA EDICION DEL SISTEMA OPERATIVO" -ForegroundColor Yellow
Write-Host "-- Via PowerShell --" -ForegroundColor Gray
try {
    Get-ComputerInfo | Select-Object OsName, OsVersion, OsArchitecture, CsModel | Format-List
} catch {
    Write-Host "Get-ComputerInfo no disponible completo en Linux, usando comandos nativos" -ForegroundColor DarkYellow
}
Write-Host "-- Via comandos nativos de Linux Mint --" -ForegroundColor Gray
uname -a
Write-Host ""
lsb_release -a
Write-Host ""
Write-Host ">> Resultado de tu equipo: Linux Mint 22.3 (basado en Ubuntu)" -ForegroundColor Green
Write-Host ""

# 4) COMANDO COMPLETO DE INFORMACION DE LA PC
Write-Host "[4] INFORMACION COMPLETA DE LA PC" -ForegroundColor Yellow
Write-Host "Consigna original (Windows): cmd /c systeminfo" -ForegroundColor Gray
Write-Host "En Linux Mint 22.3 el comando equivalente es: hostnamectl + inxi + lshw" -ForegroundColor Gray
Write-Host ""

# Intento de systeminfo (fallará en Linux, lo dejamos para demostrar la consigna)
Write-Host "--- Intento systeminfo (Windows) ---" -ForegroundColor DarkYellow
try { systeminfo } catch { Write-Host "systeminfo no existe en Linux - Es normal, es comando de Windows CMD" -ForegroundColor Red }

Write-Host ""
Write-Host "--- Equivalente real en Linux Mint (TODA la info de la PC) ---" -ForegroundColor Green
hostnamectl
Write-Host ""
# inxi da el informe completo como systeminfo
inxi -Fxxxz
