<# 

Autor: Gabriel y Diego

Fecha: 2026-01-12

Versión: 1.0

Asignatura: ASO – Unidad de Trabajo 2

Descripción:

Script de automatización para la creación de una infraestructura

básica de Active Directory del Grupo 5.
 
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
 

# PARÁMETROS DEL SCRIPT

 
param(

    # Ruta al archivo CSV con los datos de los usuarios

    [Parameter(Mandatory)]

    [string]$RutaCSV = "C:\Users\diego\Scripts\Usuarios_Grupo5.csv"

)
 

# CONFIGURACIÓN DE LOGS

 
# Comprobar si existe la carpeta de logs; si no existe, se crea

$LogFolder = "C:\Users\diego\Scripts\Logs"

if (!(Test-Path $LogFolder)) {

    New-Item -ItemType Directory -Path $LogFolder

}
 
# Ruta del fichero de log

$Log = "$LogFolder\Grupo5_AD.log"
 
# Función para escribir mensajes en el log con fecha y hora

function Escribir-Log {

    param(

        [string]$Mensaje

    )
 
    $Fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    "$Fecha - $Mensaje" | Out-File -FilePath $Log -Append

}
 

# FUNCIONES DE CREACIÓN DE OBJETOS

 
# Función para crear una Unidad Organizativa (OU) si no existe

function Crear-OU {

    param(

        [string]$OU

    )
 
    # Comprobar si la OU ya existe

    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OU'" -ErrorAction SilentlyContinue)) {

        # Crear la OU

        New-ADOrganizationalUnit -Name $OU
 
        # Registrar la acción en el log

        Escribir-Log "OU creada: $OU"

    }

}
 
# Función para crear un grupo de seguridad si no existe

function Crear-Grupo {

    param(

        [string]$Grupo

    )
 
    # Comprobar si el grupo ya existe

    if (-not (Get-ADGroup -Filter "Name -eq '$Grupo'" -ErrorAction SilentlyContinue)) {

        # Crear el grupo de seguridad (Global)

        New-ADGroup `

            -Name $Grupo `

            -GroupScope Global `

            -GroupCategory Security
 
        # Registrar la acción en el log

        Escribir-Log "Grupo creado: $Grupo"

    }

}


# CREACIÓN DE ESTRUCTURA DE AD

 
# Crear Unidades Organizativas principales

Crear-OU "OUGrupo5_Usuarios"

Crear-OU "OUGrupo5_Equipos"

Crear-OU "OUGrupo5_Grupos"
 
# Crear grupos de seguridad

Crear-Grupo "GGGrupo5_Admins"

Crear-Grupo "GGGrupo5_Empleados"
 

# CREACIÓN DE USUARIOS DESDE CSV

 
# Importar los usuarios desde el archivo CSV

$Usuarios = Import-Csv $RutaCSV
 
# Recorrer cada usuario del CSV

foreach ($U in $Usuarios) {
 
    # Comprobar si el usuario ya existe en Active Directory

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($U.Usuario)'" -ErrorAction SilentlyContinue)) {
 
        # Crear el usuario en la OU indicada

        New-ADUser `

            -Name "$($U.Nombre) $($U.Apellido)" `

            -SamAccountName $U.Usuario `

            -UserPrincipalName "$($U.Usuario)@grupo5.local" `

            -Path "OU=$($U.OU),DC=grupo5,DC=local" `

            -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `

            -Enabled $true
 
        # Registrar la creación del usuario

        Escribir-Log "Usuario creado: $($U.Usuario)"

    }
 
    # Añadir el usuario al grupo correspondiente

    Add-ADGroupMember `

        -Identity $U.Grupo `

        -Members $U.Usuario
 
    # Registrar la asignación al grupo

    Escribir-Log "Usuario $($U.Usuario) añadido al grupo $($U.Grupo)"

}
 

# FIN DEL SCRIPT

# Registrar finalización correcta del proceso

Escribir-Log "Proceso de creación de Active Directory finalizado correctamente"
