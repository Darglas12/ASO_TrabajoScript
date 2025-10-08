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

mkdir $env:HOME\Documents\Ficheros
New-Item -path $env:HOME\Documents\Ficheros\datos.csv -ItemType file
New-Item -path $env:HOME\Documents\Ficheros\Informe.docx -ItemType file
New-Item -path $env:HOME\Documents\Ficheros\Imagen.png -ItemType File