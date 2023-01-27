$minimo = Read-Host "Escribe un numero minimo"
$maximo = Read-Host "Escribe un numero maximo"

$random = Get-Random -Minimum $minimo -Maximum $maximo
$counter = 0
Clear-Host


do{

    $counter++

    $resposta = Read-Host "Escribe a resposta"

    if ($resposta -lt $random) {

        Write-Host "Proba cun numero mais grande"

    } elseif ($resposta -gt $random) {

        Write-Host "Proba cun numero mais pequeno"

    } else {

        Write-Host "Acertaches! Costouche $counter intentos."

    }

}
until($resposta -eq $random)