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
[double] $nota=Read-Host -Prompt:"Introduzca una nota [0-10]"
$notaTexto="Nota imposible"
switch($nota)
{
{($_ -ge 0) -and ($_ -lt 5)} {$notaTexto="Insuficiente"; break;}
{($_ -ge 5) -and ($_ -lt 6)} {$notaTexto="Suficiente"; break;}
{($_ -ge 6) -and ($_ -lt 7)} {$notaTexto="Bien"; break;}
{($_ -ge 7) -and ($_ -lt 9)} {$notaTexto="Notable"; break;}
{($_ -ge 9) -and ($_ -le 10)}{$notaTexto="Sobresaliente"; break;}
default { $notaTexto="Nota Imposible!"}
}
Write-Host "El número $nota equivale a $notaTexto"