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
$contador=1;
if ($contador01 -eq 9){
    $cuentaPaBajo= $true
}
else{
    $cuentaPaBajo= $false
}
$numeroFilas=3; $numeroColumnas=3
for($fila=1; $fila -le $numeroFilas; $fila++){
    $textofila=""
    for($columna=1; $columna -le $numeroColumnas; $columna++){
        $textofila= $textofila + $contador + ""
        if($cuentaPaBajo){
            $contador--
        }
        else{
            $contador++
        }
    }
    Write-host $textofila
}