#!/bin/bash
# Realice un script que mueva todos los programas del directorio actual (archivos ejecutables) 
# hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado.
# El script debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, 
# o que no ha movido ninguno. Si el directorio “bin” no existe, deberá ser creado.

# ** mapea los archivos ejecutables dentro del directorio en un arreglo
mapfile -d '' archivos < <(find . -maxdepth 1 -type f -executable -print0)

# directorio destino
DIR="$HOME/bin"

# si no existe el directorio bin, lo crea
if ! [[ -d "$DIR" ]]; then
    mkdir "$DIR"
fi

# itera los elementos del arreglo, imprime y los mueve
if (( ${#archivos[@]} == 0 )); then
    echo "No hay archivos ejecutables para mover."
    exit 1
else
    movidos=0
    for elem in "${archivos[@]}"; do
        nombre=$(basename "$elem")

        if [[ "$nombre" != "$(basename "$0")" ]]; then
            mv "$elem" "$DIR"
            echo "Se movió el archivo $nombre"
            ((movidos++))
        fi
    done
    # informar cantidad de elementos movidos
    echo "Se movieron $movidos elementos a $DIR"
fi

