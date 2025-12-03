#!/bin/bash
# ** mapea los archivos ejecutables dentro del directorio en un arreglo
mapfile -d '' archivos < <(find . -type f -executable -print0)

# guarda la cantidad de ejecutables en el directorio
cantidad=${#archivos[@]}

# directorio destino
DIR="$HOME/bin"

# si no existe el directorio bin, lo crea
if ! [[ -d $DIR ]]; then
    mkdir "$DIR"
fi

# itera los elementos del arreglo, imprime y los mueve
if (( cantidad == 0 )); then
    echo "No hay archivos ejecutables para mover."
    exit 0
else
    for elem in "${archivos[@]}"; do
        nombre=$(basename "$elem")
        mv "$elem" "$DIR"
        echo "Se movió el archivo $nombre"
    done
    # informar cantidad de elementos movidos
    echo "Se movieron $cantidad elementos a $DIR"
fi

