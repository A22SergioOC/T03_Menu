$lista = New-Object Collections.Generic.List[int]

do{

    $numero = Read-Host "Escribe un numero (escribe 0 para salir)"
    if ($numero -ne 0){
        $lista.add($numero)
    }


}
until ($numero -eq 0)

$lista = $lista | Sort-Object
Write-Host $lista