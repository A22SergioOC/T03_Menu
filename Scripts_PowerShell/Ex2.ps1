$minimo = Read-Host "Escribe un número mínimo"
$maximo = Read-Host "Escribe un número máximo"
if ($maximo -ge $minimo){

    Write-Host "Error" -ForegroundColor 'Red' 
    Start-Sleep -Seconds 3


}
$random = Get-Random -Minimum $minimo -Maximum $maximo
$counter = 0
Clear-Host

Write-Host $random

do{

    $resposta = Read-Host "Escribe a resposta"

    if ($resposta -lt $random) {

        Write-Host "Proba cun numero mais grande"

    } elseif ($resposta -gt $random) {

        Write-Host "Proba cun numero mais pequeno"

    } else {

        Write-Host "Acertaches!"

    }

    $counter++

}
until($resposta -eq $random)