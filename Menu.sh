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

function crearFicheiro() { # Esta función recolle nunha variable un nome e crea un directorio ou ficheiro co nome recollido
    echo $limpar
    echo "╔════════════════════════════════════════════════════════════════════════════════════╗"
    echo -e "║                           \033[34mQue queres crear?\033[0m                                        ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 1. Un directorio. «\033[0m                                                              ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
    echo -e "║ \033[1;34m» 2. Un ficheiro. «\033[0m                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
    read -p "Escolla unha opción: " chooseFile # A variable 'escolla' almacena a opción do menú escollida
    case $chooseFile in
        1)
            read -p "Introduce o nome do directorio: " folder_name
            echo `mkdir $folder_name`
            echo Directorio creado exitosamente.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
        2)
            read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name
            echo `touch $file_name`
            echo Ficheiro creado exitosamente.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
        *)
            echo -e "\033[31mError. Introduce unha opción válida.\033[0m"
            echo -e "\033[31mVolvendo ao menú...\033[0m"
            sleep 2
        ;;
    esac
}

function imprimirHelloWorld() {
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
    read -p "Escolla unha opción: " chooseHW
    case $chooseHW in
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
        *)
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

function eliminarArquivo() {
    read -p "Escribe o nome do arquivo a eliminar: " dfile_name
        read -p "Estás seguro de querer eliminar $dfile_name ? (s/n) " confirmfile
        if [ $confirmfile == s ]
        then
            if [ $dfile_name == "Menu.sh" ] 
            then
                echo -e "\033[31mError. Non se pode usar o programa para borrar o propio programa.\033[0m"
                echo -e "\033[31mVolvendo ao menú...\033[0m"
            elif [ -e $dfile_name ]
            then
                echo `rm -r $dfile_name`
                echo Arquivo eliminado eliminado exitosamente.
                echo -e "\033[31mVolvendo ao menú...\033[0m"
            else
                echo -e "\033[31mError. O arquivo a eliminar non existe.\033[0m"
                echo -e "\033[31mVolvendo ao menú...\033[0m"
            fi
        else
            echo Acción cancelada.
            echo -e "\033[31mVolvendo ao menú...\033[0m"
        fi
        sleep 2
}

until (( $sair == 1 ))
do
    mostrarMenu

    case $escolla in
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
        *)
        sair=1
        ;;
    esac
done

echo "Cerrando programa. Hasta outra!"
sleep 2
echo $limpar