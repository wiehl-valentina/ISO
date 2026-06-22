# Escriba un script que reciba una cantidad desconocida de parámetros
# al momento de su invocación (debe validar que al menos se reciba uno).
#
# Cada parámetro representa la ruta absoluta de un archivo o directorio
# en el File System.
#
# El script deberá iterar por todos los parámetros recibidos:
#
# - Si el parámetro es un archivo existente en el File System:
#     deberá comprimirlo dejando el archivo comprimido
#     en lugar del original.
#
# - Si el parámetro es un directorio existente en el File System:
#     - Si tiene permiso de lectura deberá empaquetarlo y comprimirlo.
#     - Si tiene permiso de escritura deberá eliminarlo junto
#       con todo su contenido.
#
# - Si el parámetro no es un elemento del File System (no existe),
#     deberá contarlo e indicar la cantidad total al finalizar el script.

#!/bin/bash

# verifica cantidad de parámetros
if (( $# < 1 )); then
    echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
    exit 1
fi

NONEXISTENT=0

for param in "$@"; do 
    if ! [[ -e "$param" ]]; then
        ((NONEXISTENT++))
    elif [[ -f "$param" ]]; then
        gzip "$param" 
    elif [[ -d "$param" ]]; then
        if [[ -r "$param" ]]; then
            tar -czf "${param}.tar.gz" "$param"
        fi
        if [[ -w "$param" ]]; then
            rm -r "$param"
        fi
    fi
done

echo "Cantidad de elementos inexistentes: $NONEXISTENT"


        

