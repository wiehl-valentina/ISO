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

#!/bin/bash

while IFS=: -r read USERNAME _ _ _ _ HOME_DIR _; do 
    # establece la cantidad de grupos a los que pertenece
    GRUPOS=$(id -nG "$USERNAME" | wc -w)
    ELEMENTOS=-1
    LOGS=$(grep -r "$USERNAME" /var/log 2>/dev/null | wc -l)
    
    # si tiene un directorio personal válido, cuento los elementos e imprimo
    if [[ -n "$HOME_DIR" && -d "$HOME_DIR" ]]; then
        ELEMENTOS=$(find "$HOME_DIR" -mindepth 1 2>/dev/null | wc -l)
        echo "$USERNAME;$GRUPOS;$HOME_DIR;$ELEMENTOS;$LOGS"
    else 
        echo "$USERNAME;$GRUPOS;XXX;$ELEMENTOS;$LOGS"
    fi 
done < /etc/passwd