#!/bin/bash
# Escriba un script que reciba el path de un archivo por parámetro,
# debe validar que exista y, en caso afirmativo, informe qué permisos
# tiene el usuario sobre dicho archivo.
# En caso de tener permisos de ejecución, quitarlos.

if (( $# != 1 )); then
    echo "Modo de uso: $0 <path_archivo>"
    exit 1
fi

ARCHIVO="$1"

if ! [[ -e "$ARCHIVO" ]]; then
    echo "Error: el archivo $ARCHIVO no existe."
    exit 2
fi

echo "Archivo: $ARCHIVO"
echo "Permisos:"
if [[ -r "$ARCHIVO" ]]; then
    echo "- Lectura"
fi
if [[ -w "$ARCHIVO" ]]; then
    echo "- Escritura"
fi
if [[ -x "$ARCHIVO" ]]; then
    echo "- Ejecución"
    chmod u-x "$ARCHIVO"
    echo
    echo "Se ha revocado el permiso de ejecución."
    echo 
fi
exit 0

