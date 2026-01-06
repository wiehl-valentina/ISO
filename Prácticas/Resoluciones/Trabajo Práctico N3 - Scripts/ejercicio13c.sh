#!/bin/bash
# chequea el pasaje de parámetros
if [ $# -ne 1 ]; then
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
    if [ $? -eq 0 ]; then 
        echo "Se creó el directorio exitosamente"
    else
        echo "Error: no pudo crearse el directorio"
    fi
fi