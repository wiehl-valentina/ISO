#!/bin/bash
# Implemente un script en Bash que:
#
# Conozca todos los usuarios que tiene el sistema y realice
# un listado en pantalla donde para cada línea se informe
# los siguientes valores separados por ";" (punto y coma):
#
#   • Nombre de usuario (username).
#   • Cantidad de grupos a los que pertenece el usuario.
#   • Path del directorio personal del usuario en caso de
#     que sea un directorio válido. Si no es válido,
#     informar "XXX".
#   • Cantidad total de archivos y directorios en el
#     directorio personal (si posee un directorio válido).
#     En caso de que el usuario no tenga un directorio
#     personal válido, informar "-1".
#   • Cantidad de líneas en las que aparece el nombre de
#     usuario (username) en los archivos de log del sistema.
#
# Recuerde que el directorio FHS recomendado para almacenar
# archivos de log es /var/log.

while IFS=: read -r USERNAME _ _ _ _ DIR _; do 
    LINEAS_LOG=$(grep -r "$USERNAME" /var/log 2>/dev/null | wc -l)
    GRUPOS=$(id -Gn "$USERNAME" 2>/dev/null | wc -w)

    if [[ -d "$DIR" ]]; then
        PATH_DIR="$DIR"
        ARCHIVOS=$(find "$DIR" -mindepth 1 -type f 2>/dev/null | wc -l) 
        DIRECTORIOS=$(find "$DIR" -mindepth 1 -type d 2>/dev/null | wc -l)
        TOTAL_ARCHIVOS=$(( ARCHIVOS + DIRECTORIOS ))
    else
        PATH_DIR="XXX"
        TOTAL_ARCHIVOS="-1"
    fi
    echo "$USERNAME;$GRUPOS;$PATH_DIR;$TOTAL_ARCHIVOS;$LINEAS_LOG"
done < /etc/passwd
