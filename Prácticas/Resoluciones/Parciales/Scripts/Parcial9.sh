# Realice un script en Bash que reciba como argumento una lista
# de nombres de usuario (se deberá validar que se reciba al menos uno),
# y para cada uno de los nombres de usuario recibidos que exista
# en el sistema deberá imprimir un reporte con la siguiente información:

# - Nombre de usuario.
# - Ruta al directorio personal (HOME), solo si el usuario tiene
#   un directorio personal configurado y éste existe.
#   Si no, informar el texto: "Sin HOME".
#   Pista: Recuerde el archivo visto que contiene esta información.
# - Cantidad de archivos (no directorios) con terminación ".docx"
#   en su nombre que existan en su directorio personal y sus
#   subdirectorios.
#   Se deberá informar 0 si el usuario no posee un directorio
#   personal o no existe.

#!/bin/bash

# verifica el pasaje de parámetros
if (( $# < 1 )); then
    echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
    exit 1
fi

for user in "$@"; do 
    # ** guardo el resultado del comando en una variable para accederlo más de 1 vez
    QUERY=$(getent passwd "$user")

    # si el usuario existe en el sistema
    if [[ -n "$QUERY" ]]; then
        echo "Usuario: $user"

        # guarda el home del usuario que ya sabe que existe 
        HOME_DIR=$(echo "$QUERY" | cut -d: -f6)

        # verifica si tiene home configurado e imprime
        if [[ -n "$HOME_DIR" && -d "$HOME_DIR" ]]; then
            echo "Home: $HOME_DIR"
            # busca los archivos .docx
            CANT_ARCHIVOS=$(find "$HOME_DIR" -type f -name "*.docx" 2>/dev/null | wc -l)
            echo "Cantidad de archivos .docx: $CANT_ARCHIVOS"
            echo
        else
            echo "Sin HOME."
            echo "Cantidad de archivos .docx: 0."
            echo
        fi
    fi
done

        



