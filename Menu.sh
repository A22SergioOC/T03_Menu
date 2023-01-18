#!/bin/bash

# --MENÚ EN BASH--
# Sergio Otero

limpar=`clear`
sair=0

function mostrarMenu() {
echo $limpar
echo Escolla unha opción:

echo "Prema 1 para listar o contido do directorio."

echo "Prema 2 para crear un directorio."

echo "Prema 3 para crear un ficheiro."

echo "Prema 4 para engadir un liña a un ficheiro (se non existe o ficheiro, créao)"

echo "Prema 5 para borrar un ficheiro ou directorio."

echo "Prema calquera outra tecla para cerrar o menú."
}

echo Benvido ao xestor de ficheiros.
read -p "Para comezar, introduce a carpeta sobre a que traballar: " folder

if [ -z $folder ]
then
    folder=`$HOME/*`
fi

if [ -e $folder ]
then
    echo `mkdir $folder`
fi

echo `cd $folder`

until (( $sair == 1 ))
do
    mostrarMenu

    read escolla

    case $escolla in
        1)
        echo `ls`
        sleep 5
        ;;
        2)
        read -p "Introduce o nome do directorio: " folder_name
        echo `mkdir $folder_name`
        echo Directorio creado exitosamente.
        sleep 3
        ;;
        3)
        read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name
        echo `touch $file_name`
        echo Ficheiro creado exitosamente.
        sleep 3
        ;;
        4)
        read -p "Introduce o nome do ficheiro (coa extensión incluída): " file_name_edit
        read -p "Escribe a liña a engadir: " linha
        echo `echo $linha >> $file_name_edit`
        echo Ficheiro modificado exitosamente.
        sleep 3
        ;;
        5)
        read -p "Escribe o nome do arquivo a eliminar: " dfile_name
        read -p "Estás seguro de querer eliminar $dfile_name ? (s/n) " confirmfile
        if [ $confirmfile == s ]
        then
            echo `rm -r $dfile_name`
            echo Arquivo eliminado eliminado exitosamente
        else
            echo Acción cancelada.
        fi
        sleep 3
        ;;
        *)
        sair=1
        ;;
    esac
done

echo "Cerrando programa. Hasta outra!"
sleep 3