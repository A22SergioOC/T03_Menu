#!/bin/bash

# --MENÚ EN BASH--
# Sergio Otero

# Ao executar este programa móstrase un menú con 5 distintas opcións, que permiten crear directorios e arquivos,
# engadir unha liña a un arquivo ou eliminar arquivos, todo dentro do directorio onde se atopa o script.
# (Por razóns lóxicas, o script está programado de forma que non se pode eliminar a si mesmo).

# DECLARACIÓN DE VARIABLES E FUNCIÓNS
# Aquí decláranse as variables e as funcións que logo se usarán para crear o programa

limpar=`clear` # Variable que almacena o comando 'clear', para limpar a terminal
sair=0 # Variable que almacena un valor numérico, que se usará como condición para sair do programa

function mostrarMenu() { # Esta función imprime por pantalla o menú e premite introducir a opción que se desexe
echo $limpar
echo "╔════════════════════════════════════════════════════════════════════════════════════╗"
echo -e "║                           \033[34mBenvido ao xestor de ficheiros.\033[0m                          ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e "║ \033[1;34m» Prema 1 para listar o contido do directorio. «\033[0m                                   ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e "║ \033[1;34m» Prema 2 para crear un directorio ou ficheiro. «\033[0m                                  ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e  "║ \033[1;34m» Prema 3 para imprimir un Hello World!. «\033[0m                                         ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e "║ \033[1;34m» Prema 4 para engadir un liña a un ficheiro (se non existe o ficheiro, créao) «\033[0m   ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e "║ \033[1;34m» Prema 5 para borrar un ficheiro ou directorio. «\033[0m                                 ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo -e "║ \033[1;34m» Prema calquera outra tecla para cerrar o menú. «\033[0m                                 ║"
echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
read -p "Escolla unha opción: " escolla # A variable 'escolla' almacena a opción do menú escollida
}

function listarContido() { # Esta función mostra o contido do directorio
    echo `ls`
    echo -e "\033[31mVolvendo ao menú...\033[0m"
    sleep 4 # O 'sleep' úsase para esperar un tempo determinado en segundos antes de executar o resto do programa
}

function crearFicheiro() { # Esta función mostra un menú secundario para crear un directorio ou ficheiro co nome recollido
    echo $limpar
    echo "╔════════════════════════════════════════════════════════════════════════════════════╗"
    echo -e "║                           \033[34mQue queres crear?\033[0m                                        ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 1. Un directorio. «\033[0m                                                              ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 2. Un ficheiro. «\033[0m                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
    read -p "Escolla unha opción: " chooseFile # A variable 'chooseFile' almacena a opción do menú escollida (directorio ou ficheiro)
    case $chooseFile in
        1) # No caso de ser un directorio, almacena un nome e crea un directorio con ese nome
            read -p "Introduce o nome do directorio: " folder_name
            echo `mkdir $folder_name`
            echo Directorio creado exitosamente.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
        2) # No caso de ser un ficheiro, almacena un nome e crea un ficheiro con ese nome (e extensión se se engade ao nome)
            read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name
            echo `touch $file_name`
            echo Ficheiro creado exitosamente.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
        *) # No caso de seleccionar un distinta ás do menú, dá erro e volve ao menú principal
            echo -e "\033[31mError. Introduce unha opción válida.\033[0m"
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
    esac
}

function imprimirHelloWorld() { # Esta función mostra un menú secundario para imprimir un Hello World en diferentes estilos ASCII
    echo $limpar
    echo "╔════════════════════════════════════════════════════════════════════════════════════╗"
    echo -e "║                           \033[34mQue estilo prefires?\033[0m                                     ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 1. Big. «\033[0m                                                                        ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 2. Rectangles. «\033[0m                                                                 ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 3. 3D ASCII. «\033[0m                                                                   ║"
    echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
    read -p "Escolla unha opción: " chooseHW # A variable 'chooseHW' almacena a opción escollida
    case $chooseHW in # Dependendo da opción escollida, imprime un estilo ou outro
        1)
            echo "  _    _      _ _        __          __        _     _ "
            echo " | |  | |    | | |       \ \        / /       | |   | |"
            echo " | |__| | ___| | | ___    \ \  /\  / /__  _ __| | __| |"
            echo " |  __  |/ _ \ | |/ _ \    \ \/  \/ / _ \| '__| |/ _' |"
            echo " | |  | |  __/ | | (_) |    \  /\  / (_) | |  | | (_| |"
            echo " |_|  |_|\___|_|_|\___/      \/  \/ \___/|_|  |_|\__,_|"
            echo
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 3
        ;;
        2)
            echo " _____     _ _        _ _ _         _   _ "
            echo "|  |  |___| | |___   | | | |___ ___| |_| |"
            echo "|     | -_| | | . |  | | | | . |  _| | . |"
            echo "|__|__|___|_|_|___|  |_____|___|_| |_|___|"
            echo
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 3
        ;;
        3)
            echo " ___  ___  _______   ___       ___       ________          ___       __   ________  ________  ___       ________     "
            echo "|\  \|\  \|\  ___ \ |\  \     |\  \     |\   __  \        |\  \     |\  \|\   __  \|\   __  \|\  \     |\   ___ \    "
            echo "\ \  \ \  \ \   __/|\ \  \    \ \  \    \ \  \|\  \       \ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \    \ \  \_|\ \   "
            echo " \ \   __  \ \  \_|/_\ \  \    \ \  \    \ \  \ \  \       \ \  \  __\ \  \ \  \ \  \ \   _  _\ \  \    \ \  \  \ \  "
            echo "  \ \  \ \  \ \  \_|\ \ \  \____\ \  \____\ \  \ \  \       \ \  \|\__\_\  \ \  \ \  \ \  \    \ \  \____\ \  \_ \ \ "
            echo "   \ \__\ \__\ \_______\ \_______\ \_______\ \_______\       \ \____________\ \_______\ \__\  _ \ \_______\ \_______\ "
            echo "    \|__|\|__|\|_______|\|_______|\|_______|\|_______|        \|____________|\|_______|\|__|\|__|\|_______|\|_______| "
            echo
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 3
        ;;
        *) # No caso de seleccionar un distinta ás do menú, dá erro e volve ao menú principal
            echo -e "\033[31mError. Introduce unha opción válida.\033[0m"
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
    esac

}

function engadirLinha() { #Esta función recolle unha liña e añade a liña a un ficheiro. Se o ficheiro non existe, automáticamente crea un ficheiro e engade a liña.
    read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name_edit
        read -p "Escribe a liña a engadir: " linha
        echo `echo $linha >> $file_name_edit`
        echo Ficheiro modificado exitosamente.
        echo -e "\033[31mVolvendo ao menú...\033[0m"
        sleep 2
}

function eliminarArquivo() { #Esta función serve para eliminar un arquivo ou directorio xa existente
    read -p "Escribe o nome do arquivo a eliminar: " dfile_name # Recolle o nome do ficheiro
    if [ -e $dfile_name ] # Aquí comproba se o arquivo a eliminar existe. Se, en efecto, existe, procede a borrar o arquivo.
    then
        read -p "Estás seguro de querer eliminar $dfile_name ? (s/n) " confirmfile # Pregunta outra vez se se quere eliminar, por cuestións de seguridade
        if [ $confirmfile == s ] # Se se volve a confirmar, elimínase e volve ao menú principal
        then
            if [ $dfile_name == "Menu.sh" ] # Comproba se o arquivo a eliminar é o propio script. Nese caso, automáticamente dá erro e cancélase a acción
            then                            # Este proceso faise por razóns obvias. Se se elimina o script, xa non se poderá volver a executar.
                echo -e "\033[31mError. Non se pode usar o programa para borrar o propio programa.\033[0m"
                echo -e "\033[31mVolvendo ao menú...\033[0m"
            elif [ $dfile_name == "Scripts_PowerShell" ]
            then
                echo -e "\033[31mError. Esa carpeta está protexida ao pertencer a outro exercicio.\033[0m"
                echo -e "\033[31mVolvendo ao menú...\033[0m"
            else
                echo `rm -r $dfile_name`
                echo Arquivo eliminado exitosamente.
                echo -e "\033[31mVolvendo ao menú...\033[0m" 
                
            fi
        else # Se ao volver a preguntar se decide non eliminar o arquivo, a acción cancélase e vólvese ao menú principal
            echo Acción cancelada.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
        fi
    else # No caso de que o arquivo non exista, dá erro, a acción cancélase e volve ao menú principal
        echo -e "\033[31mError. O arquivo a eliminar non existe.\033[0m"
        echo -e "\033[31mVolvendo ao menú...\033[0m"
    fi
    sleep 2
}

until (( $sair == 1 )) # Este bucle serve para usar o menú varias veces. Sin este bucle, ao escoller unha opción e executala, saldría do programa automáticamente,
do                     # e habería que volver a executar o programa.
    mostrarMenu

    case $escolla in # Dependendo da opción escollida no menú principal, executa a función correspondente.
        1)
        listarContido
        ;;
        2)
        crearFicheiro
        ;;
        3)
        imprimirHelloWorld
        ;;
        4)
        engadirLinha
        ;;
        5)
        eliminarArquivo
        ;;
        *) # No caso de seleccionar un distinta ás do menú, o bucle acaba e sae do programa.
        sair=1
        ;;
    esac
done

echo "Cerrando programa. Hasta outra!" # Ao saír do programa, mostra unha mensaxe de despedida.
sleep 2
echo $limpar # Ao final, limpa a terminal.