#!/bin/bash
# chequea pasaje de parámetro
if (( $# != 1 )); then
    echo "Modo de uso: $0 <archivo>"
    exit 1
fi

# valida la existencia del directorio
if ! [[ -d "$1" ]]; then
    echo "Error: el directorio no existe."
    exit 4
fi

# función para sumar los archivos
contar_archivos() {
    # guarda la ruta
    directorio=$1
    # busca dentro del directorio archivos con permiso de lectura o escritura y los cuenta
    lectura=$(find "$directorio" -maxdepth 1 -type f -readable | wc -l)
    escritura=$(find "$directorio" -maxdepth 1 -type f -writable | wc -l)
    echo "Cantidad de archivos con permiso de lectura: $lectura"
    echo "Cantidad de archivos con permiso de escritura: $escritura"
}

# si el archivo existe, llama a la función
contar_archivos "$1"


