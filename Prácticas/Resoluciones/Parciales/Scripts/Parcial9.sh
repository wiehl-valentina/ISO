#!/bin/bash
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


if (( $# < 1 )); then
    echo "Modo de uso: $0 <lista_de_usuarios>"
    exit 1
fi

for user in "$@"; do
    while IFS=: read -r USERNAME _ _ _ _ DIR _; do 
        if [[ "$user" == "$USERNAME" ]]; then
            echo "Usuario: $user"
            if [[ -d "$DIR" ]]; then 
                echo "Ruta del home: $DIR"
                echo "Cantidad de archivos .docx: $(find "$DIR" -type f -name "*.docx" 2>/dev/null | wc -l)"
            else
                echo "Sin HOME"
                echo "Cantidad de archivos .docx: 0"
            fi 
            break
        fi
    done < /etc/passwd
done