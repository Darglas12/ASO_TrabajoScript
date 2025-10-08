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

[int]$Numero = read-host -prompt "Introduce un numero"
if($Numero % 2 -eq 0){
    mkdir $env:HOME/Par 

}
else {
    mkdir $env:HOME/Impar
}