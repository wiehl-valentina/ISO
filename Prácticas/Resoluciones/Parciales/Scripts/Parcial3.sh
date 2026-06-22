#!/bin/bash
# Escribir un script en Bash que reciba como argumento una lista de nombres de usuario (debe validar que se reciba, al
# menos, uno) y, para cada uno de los usuarios válidos que se hayan recibido, deberá imprimir un reporte con la siguiente
# información:
# • Nombre de usuario.
# • Ruta al directorio personal, sólo si el usuario tiene directorio personal configurado y éste existe.
# • Cantidad de archivos (no directorios) en su directorio personal. Deberá informar 0 si el usuario no posee directorio
# personal o no existe

if (( $# == 0 )); then 
    echo "Modo de uso: $0 <lista_de_usuarios>"
    exit 1
fi

for user in "$@"; do
    while IFS=: read -r USERNAME _ _ _ _ DIR _; do 
        if [[ "$USERNAME" == "$user" ]]; then
            echo "Usuario: $user"
            if [[ -d "$DIR" ]]; then
                echo "Directorio personal: $DIR"
                echo "Archivos en su directorio personal: $(find "$DIR" -type f 2>/dev/null | wc -l)"
            else
                echo "Archivos en su directorio personal: 0"
            fi
            break
        fi
    done < /etc/passwd
done

