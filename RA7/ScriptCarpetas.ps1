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
$Grupos= @("ASIR1", "ASIR2", "DAW1", "DAW2", "DAM1", "DAM2", "SMR1", "SMR2", "SMRD1", "SMRD2")
$carpetaRaiz="C:/users/Administrador/CARPETAS/"
foreach($Grupo in $Grupos){
    Write-Host "Creando clase $Grupo"
    $carpetaGrupos= $carpetaRaiz + $Grupo + "\"
    $CarpetaCreada= mkdir $carpetaGrupos
    for($nSubcarpeta=1; $nSubcarpeta -le 20; $nSubcarpeta++){
    $nCarpeta = $Grupo + "@{0:20}";
    Write-Host "Creando subcarpeta de $nCarpeta"
    $carpetaAlumno= $carpetaGrupos + $nCarpeta
    $carpetaRaiz= "C:/users/Administrador/CARPETAS/$Carpetascreada"
    $subCarpetacreada= mkdir $carpetaAlumno
    }
}