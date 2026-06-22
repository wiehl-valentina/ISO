#!/bin/bash
# Escribir un script en Bash que:
#
#   - Reciba como argumento una lista de nombres de usuario.
#   - Debe validar que se reciba al menos un usuario.
#
#   Para cada usuario válido recibido deberá imprimir un reporte con:
#
#   • Nombre de usuario.
#   • Ruta del directorio personal (solo si lo tiene configurado y existe).
#   • Indicar si el directorio personal existe o no.
#   • Cantidad de archivos (NO directorios) dentro de su directorio personal.
#
#   Además:
#   - Indicar cómo se debería ejecutar el script.
#   - Asumir que el archivo se llama "reporte.sh".
#   - La salida debe guardarse en un archivo llamado "reporte.txt"
#     dentro del directorio personal del usuario que ejecuta el script.
#   - El archivo debe sobrescribirse si ya existe.

if (( $# == 0 )); then
    echo "Modo de uso: $0 <nombres_usuario>"
    exit 2
fi

OUTPUT="$HOME/reporte.txt"

for user in "$@"; do 
    while IFS=: read -r USERNAME _ _ _ _ DIR _; do 
        if [[ "$user" == "$USERNAME" ]]; then
            echo "Usuario: $user" 
            if [[ -d "$DIR" ]]; then
                echo "Directorio personal: $DIR" 
                echo "Cantidad de archivos: $(find "$DIR" -type f 2>/dev/null | wc -l)" 
            else
                echo "El directorio personal del usuario no existe." 
            fi
            echo "------------------"
            echo
            break
        fi
    done < /etc/passwd
done > "$OUTPUT"




