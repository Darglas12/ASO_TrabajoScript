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

Clear-Host 
[double] $Edad = Read-Host -prompt= "Introduzca su edad"
If ($Edad -ge 18) {
    Write-Host "Es mayor de Edad"
}
else{
    Write-Host "Es menor de Edad"
}