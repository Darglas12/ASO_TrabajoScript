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

$i = @(Get-ChildItem $env:HOME\Documents\Ficheros)
foreach($a in $i){
    if ($a.Name -like '*.csv') {
        Write-Host "$($a.Name) Es un fichero de datos"
    }
    elseif ($a.Name -like '*.docx') {
        Write-Host "$($a.Name) Es un documento de texto"
    }
    elseif ($a.Name -like '*.png') {
        Write-Host "$($a.Name) Es una imagen"
    }
    else {
        Write-Host "$($a.Name) Tipo de fichero no reconocido"
    }
    write-host "Este es el fichero $a"

}
