#!/bin/bash
# chequea pasaje de parámetros
if [ $# -ne 3 ]; then
    echo "Modo de uso: $0 directorio -a|-b cadena"
    exit 1
fi

# guarda los valores de los parámetros
directorio=$1
modo=$2
cadena=$3

# chequea el modo y appendea
if [ $modo = "-a" ]; then
    for f in "$directorio"/*; do
        mv "$f" "${f}${cadena}"
    done
elif [ $modo = "-b" ]; then
    for f in "$directorio"/*; do
        nombre=$(basename "$f")
        mv "$f" "${directorio}/${cadena}${nombre}"
    done
else
    echo "Opciones válidas: -a | -b"
fi
