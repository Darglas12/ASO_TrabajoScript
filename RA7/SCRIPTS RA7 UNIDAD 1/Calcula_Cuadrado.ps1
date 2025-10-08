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

$Numeros = @(1..10)
foreach ($a in $Numeros){
    write-host "$a al cuadrado = $($a*$a)"
}