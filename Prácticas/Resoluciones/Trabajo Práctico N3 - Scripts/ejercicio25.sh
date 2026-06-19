#!/bin/bash
# Escriba un script que reciba una cantidad desconocida de parámetros al
# momento de su invocación (debe validar que al menos se reciba uno). 
# Cada parámetro representa la ruta absoluta de un archivo o directorio en el sistema. El
# script deberá iterar por todos los parámetros recibidos, y solo para aquellos
# parámetros que se encuentren en posiciones impares (el primero, el tercero, etc)
# verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla
# que tipo de objeto es (archivo o directorio). Además, deberá informar la cantidad
# de archivos o directorios inexistentes en el sistema.

if (( $# == 0 )); then
    echo "Error: debe pasarse al menos una ruta absoluta de un archivo como parámetro."
    exit 1
fi

# guarda los parámetros en un arreglo
params=("$@")
# inicia contador de archivos inexistentes
inexistentes=0

# iteración de los parámetros
for i in "${!params[@]}"; do 
    # debido a que el índice comienza en 0 y se necesita operar sobre los elementos
    # en posiciones impares (1, 3, 5), se debe trabajar sobre los índices pares
    if (( i%2 == 0 )); then
        ruta="${params[$i]}"
        # chequea existencia y tipo
        if [ -e "$ruta" ]; then
            if [ -f "$ruta" ]; then
                echo "$ruta es un archivo regular."
            elif [ -d "$ruta" ]; then
                echo "$ruta es un directorio."
            else 
                echo "$ruta existe pero no es un archivo regular ni un directorio."
            fi
        else
            ((inexistentes++))
        fi
    fi
done
echo "Cantidad de archivos inexistentes: $inexistentes"
exit 0
    

