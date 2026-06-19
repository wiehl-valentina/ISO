#!/bin/bash
# Crear un script que reciba como parámetro el nombre de un archivo e
# informe si el mismo existe o no, y en caso afirmativo indique si es un
# directorio o un archivo. En caso de que no exista el archivo/directorio cree
# un directorio con el nombre recibido como parámetro.

# chequea el pasaje de parámetros
if (( $# != 1 )); then
    echo "Modo de uso: $0 archivo"
    exit 1
fi

# guarda el valor del parámetro
archivo=$1

# chequea si existe tal archivo
if [ -e "$archivo" ]; then
    if [ -f "$archivo" ]; then
        echo "Es un archivo regular"
    elif [ -d "$archivo" ]; then
        echo "Es un directorio"
    else 
        echo "No es un archivo regular ni un directorio"
    fi 
else 
    echo "El archivo no existe"
    echo ""
    echo "Creando directorio..."
    mkdir $archivo
    echo ""
    # informa si pudo crearse el directorio o no
    if (( $? == 0 )); then 
        echo "Se creó el directorio exitosamente"
    else
        echo "Error: no pudo crearse el directorio"
    fi
fi