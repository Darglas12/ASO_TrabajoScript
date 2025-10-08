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
write-host "Mostrar fecha"
write-host "Mostrar Usuario"
write-host "Salir"
[int]$Opcion = read-host -prompt "Elija una opcion"
Switch($Opcion){
    1 {date; break}
    2 {whoami; break}
    3 {exit}
    default {write-host "Error"}
}