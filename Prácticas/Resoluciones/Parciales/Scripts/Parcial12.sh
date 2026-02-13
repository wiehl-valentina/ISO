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

#!/bin/bash

validar_parametros() {
    if (( $# < 1 )); then
        echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
        exit 1
    fi  
}

construir_reporte() {
    for user in "$@"; do
        ARCHIVOS=0
        QUERY=$(getent passwd "$user")
        if [[ -n "$QUERY" ]]; then
            USERNAME=$(echo "$QUERY" | cut -d: -f1)
            HOME_DIR=$(echo "$QUERY" | cut -d: -f6)
            echo "Usuario: $USERNAME"
            echo "--------------------"
            # chequea directorio personal
            if [[ -n "$HOME_DIR" && -d "$HOME_DIR" ]]; then
                echo "El directorio personal existe"
                echo "Ruta: $HOME_DIR"
                # busca cantidad de archivos en home
                ARCHIVOS=$(find "$HOME_DIR" -maxdepth 1 -type f | wc -l)
            elif [[ -n "$HOME_DIR" && ! -d "$HOME_DIR" ]]; then
                echo "El directorio personal no existe"
            elif [[ -z "$HOME_DIR" ]]; then
                echo "El usuario no tiene directorio personal configurado"
            fi
            echo "Cantidad de archivos en el directorio personal: $ARCHIVOS"
        else
            echo "El usuario $user no existe" 
        fi
        echo
    done
}

SALIDA="$HOME/reporte.txt"

validar_parametros "$@"

construir_reporte > "$SALIDA"



