#!/bin/bash

# Realice un script que reciba como argumento una lista de posibles nombres de
# usuarios del sistema y, para cada uno de los que efectivamente existan en el
# sistema y posean un directorio personal configurado que sea válido, realice las
# modificaciones necesarias en su directorio personal para que tenga un
# subdirectorio llamado “directorio_iso” con la siguiente estructura: 
# directorio "2025" --> 12 archivos txt
# directorio "2026" --> 12 archivos txt

# Para resolver la creación de los directorios y archivos utilice la
# funcionalidad “Brace Expansion” brindada por bash:


if (( $# == 0 )); then
    echo "Error: debe pasar nombres de usuarios como parámetro."
    exit 1
fi

for user in "$@"; do
    while IFS=: read -r usuario _ _ _ _ directorio _; do
        if [[ "$user" == "$usuario" ]]; then 
            if [[ -d "$directorio" ]]; then
                mkdir "$directorio/directorio_iso/"{2025,2026}
                touch "$directorio/directorio_iso/"{2025,2026}"/archivo"{1..12}".txt"
                echo "Estructura creada con éxito para el usuario $user"
            else 
                echo "El usuario $user existe pero no tiene configurado un directorio personal."
            fi
            break
        fi
    done < /etc/passwd 
done 
    