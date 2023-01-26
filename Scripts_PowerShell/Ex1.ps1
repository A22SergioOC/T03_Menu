do{

    $num = Read-Host "Escribe un numero"
    
    $counter = 0

    if (($num -eq 2) -and ($num -eq 3) -and ($num -eq 1)) {

        Write-Host  "Es primo"

    } else {

        for (($i = 2); $i -le $num/2; $i++) {

            if (($num % $i -eq 0)) {

                $counter++;
            
            }
        
        }

    }

    if ($counter -ne 0) {

        Write-Host "Non e primo"
    
    } else {

        Write-Host "E primo"

    }

    $sair = Read-Host "Queres sair? (s/n)"

}
until($sair -eq "s")
exit 0