<#
Autor: Gabriel y Diego
Fecha: 2026-01-12
Versión: 1.0
Asignatura: ASO – Unidad de Trabajo 2
Descripción:
Script de automatización para la creación de una infraestructura básica de Active Directory del Grupo 5.

Funcionalidades:
- Creación de Unidades Organizativas (UOs)
- Creación de grupos de seguridad
- Creación de usuarios a partir de un CSV
- Asignación de usuarios a grupos
- Comprobación de existencia para evitar duplicados
- Generación de un fichero de logs del proceso

Requisitos:
- Ejecutar como Administrador de Dominio
- Módulo ActiveDirectory instalado

#>

# ================================
# PARÁMETROS DEL SCRIPT
# ================================
param(
    [Parameter(Mandatory)]
    [string]$RutaCSV = "C:\Users\diego\Scripts\Usuarios_Grupo5.csv"
)

# ================================
# IMPORTAR MÓDULO ACTIVE DIRECTORY
# ================================
if (-not (Get-Module -ListAvailable ActiveDirectory)) {
    Write-Error "El módulo ActiveDirectory no está instalado. Instale el rol AD DS o RSAT."
    exit
}

Import-Module ActiveDirectory

# ================================
# CONFIGURACIÓN DE LOGS
# ================================
$LogFolder = "C:\Users\diego\Scripts\Logs"
if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder
}

$Log = "$LogFolder\Grupo5_AD.log"

function Escribir-Log {
    param([string]$Mensaje)
    $Fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Fecha - $Mensaje" | Out-File -FilePath $Log -Append
}

# ================================
# FUNCIONES DE CREACIÓN DE OBJETOS
# ================================
function Crear-OU {
    param([string]$OU)

    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OU'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $OU
        Escribir-Log "OU creada: $OU"
    }
}

function Crear-Grupo {
    param([string]$Grupo)

    if (-not (Get-ADGroup -Filter "Name -eq '$Grupo'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $Grupo -GroupScope Global -GroupCategory Security
        Escribir-Log "Grupo creado: $Grupo"
    }
}

# ================================
# CREACIÓN DE ESTRUCTURA DE AD
# ================================
Crear-OU "OUGrupo5_Usuarios"
Crear-OU "OUGrupo5_Equipos"
Crear-OU "OUGrupo5_Grupos"

Crear-Grupo "GGGrupo5_Admins"
Crear-Grupo "GGGrupo5_Empleados"

# ================================
# CREACIÓN DE USUARIOS DESDE CSV
# ================================
$Usuarios = Import-Csv $RutaCSV

foreach ($U in $Usuarios) {

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($U.Usuario)'" -ErrorAction SilentlyContinue)) {

        New-ADUser -Name "$($U.Nombre) $($U.Apellido)" `
                   -SamAccountName $U.Usuario `
                   -UserPrincipalName "$($U.Usuario)@grupo5.local" `
                   -Path "OU=$($U.OU),DC=grupo5,DC=local" `
                   -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
                   -Enabled $true

        Escribir-Log "Usuario creado: $($U.Usuario)"
    }

    Add-ADGroupMember -Identity $U.Grupo -Members $U.Usuario
    Escribir-Log "Usuario $($U.Usuario) añadido al grupo $($U.Grupo)"
}

# ================================
# FIN DEL SCRIPT
# ================================
Escribir-Log "Proceso de creación de Active Directory finalizado correctamente"
