#!/bin/bash

# --MENÚ EN BASH--
# Sergio Otero

limpar=`clear`
sair=0

function mostrarMenu() {
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
read -p "Escolla unha opción: " escolla
}

function crearDirectorio() {
    read -p "Introduce o nome do directorio: " folder_name
    echo `mkdir $folder_name`
    echo Directorio creado exitosamente.
    sleep 2
}

function crearFicheiro() {
    read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name
        echo `touch $file_name`
        echo Ficheiro creado exitosamente.
        sleep 2
}

function engadirLinha() {
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
            echo `rm -r $dfile_name`
            echo Arquivo eliminado eliminado exitosamente
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
        echo `ls`
        sleep 4
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