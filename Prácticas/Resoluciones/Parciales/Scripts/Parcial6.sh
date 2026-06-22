#!/bin/bash
# Realice un script que liste en la salida estándar los nombres de
# los usuarios del sistema que tengan directorio personal configurado
# y que este exista en el filesystem.
#
# Si no encuentra ninguno, deberá terminar con un exit status de error.
#
# Ayuda:
# El campo 6 del archivo del sistema con información sobre los usuarios
# contiene la ruta del directorio personal configurado para cada usuario.

encontre=0

while IFS=: read -r USERNAME _ _ _ _ DIR _; do 
    if [[ -d "$DIR" ]]; then
        encontre=1
        echo "El usuario $USERNAME tiene configurado su directorio personal."
    fi 
done < /etc/passwd

if (( encontre == 0 )); then
    exit 1
fi

exit 0