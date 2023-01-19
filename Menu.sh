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
echo "║ » Prema 1 para listar o contido do directorio. «                                   ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo "║ » Prema 2 para crear un directorio. «                                              ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo "║ » Prema 3 para crear un ficheiro. «                                                ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo "║ » Prema 4 para engadir un liña a un ficheiro (se non existe o ficheiro, créao) «   ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo "║ » Prema 5 para borrar un ficheiro ou directorio. «                                 ║"
echo "╠════════════════════════════════════════════════════════════════════════════════════╣"
echo "║ » Prema calquera outra tecla para cerrar o menú. «                                 ║"
echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
read -p "Escolla unha opción: " escolla # A variable 'escolla' almacena a opción do menú escollida
}

function listarContido() { # Esta función mostra o contido do directorio
    echo `ls`
    sleep 4 # O 'sleep' úsase para esperar un tempo determinado en segundos antes de executar o resto do programa
}

function crearDirectorio() { # Esta función recolle nunha variable un nome e crea un directorio co nome recollido
    read -p "Introduce o nome do directorio: " folder_name
    echo `mkdir $folder_name`
    echo Directorio creado exitosamente.
    sleep 2
}

function crearFicheiro() { # Esta función recolle nunha variable un nome e crea un ficheiro co nome (e extensión) recollido
    read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name
        echo `touch $file_name`
        echo Ficheiro creado exitosamente.
        sleep 2
}

function engadirLinha() { #Esta función recolle unha liña e añade a liña a un ficheiro. Se o ficheiro non existe, automáticamente crea un ficheiro e engade a liña.
    read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name_edit
        read -p "Escribe a liña a engadir: " linha
        echo `echo $linha >> $file_name_edit`
        echo Ficheiro modificado exitosamente.
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
            elif [ -d $dfile_name ]
            then
                echo `rm -r $dfile_name`
                echo Arquivo eliminado eliminado exitosamente.
            else
                echo -e "\033[31mError. O arquivo a eliminar non existe.\033[0m"
            fi
        else
            echo Acción cancelada.
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
        crearDirectorio
        ;;
        3)
        crearFicheiro
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