<#
.SYNOPSIS
Script Condicional
.DESCRIPTION
Mostrar si un numero es Par o Impar
.PARAMETER [NombreParametro]
 [Explicación de lo que hace este parámetro]
.EXAMPLE
No hay ejemplo
.NOTES
 Autor: Gabriel Calvo Aja
 Fecha: 10/11/2006
 Versión: 1.0
 Notas: no hay notas
#>

clear-host 
mkdir C:\Users\Administrador\Documents\Logs
for($i=0; $i -le 10; $i++){
    New-Item -Path C:\Users\Administrador\Documents\Logs\log$i.txt -ItemType file
}