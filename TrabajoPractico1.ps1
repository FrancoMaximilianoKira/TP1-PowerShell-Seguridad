powershell
# TP1 - Programacion para Seguridad Informatica
# Docente: Lic. Carlos Pacheco
# Alumno: Franco Chavez
# Equipo: franco-HP-Laptop-15-fc0xxx - Linux Mint 22.3
# PowerShell 7.6.8 Core
$PSVersionTable.PSVersion
Get-ExecutionPolicy
Get-ComputerInfo | Select-Object OsName, WindowsEditionId, OsVersion
systeminfo
