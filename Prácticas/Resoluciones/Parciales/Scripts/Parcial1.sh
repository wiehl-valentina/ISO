#!/bin/bash 
# Realizar un script en Bash que, cada 1 hora, busque, en cada directorio home (y sus subdirectorios) de cada usuario del
# sistema, si el usuario contiene un archivo cuyo nombre es igual al parámetro que debe recibir el script. En caso de no
# encontrarse esta situación, se debe registrar, en un archivo de log llamado “archivo-encontrado<PARAMETRO>.log”
# (ubicado en el directorio correspondiente segun FHS), el full path del archivo encontrado. <PARAMETRO> representa el
# valor del parámetro que recibe el script. La ejecución del script finaliza retornando el codigo 0, una vez que se encontró,
# al menos, 10 veces el nombre del archivo entre todos los home de usuario. Se debe validar que el script recibe un único
# parámetro (que es el nombre del archivo a buscar) y, en caso contrario, debe imprimir un mensaje de error correspondiente
# y finalizar con el código de error 2

if (( $# != 1 )); then
    echo "Modo de uso: $0 <nombre_archivo>"
    exit 2
fi

PARAM="$1"
OUTPUT="/var/log/archivo-encontrado$PARAM.log"

encontrado=0
while true; do

    declare -A homes_vistos
    directorios=()

    while IFS=: read -r _ _ _ _ _ DIR _; do
        if [[ -d "$DIR" && -z "${homes_vistos[$DIR]}" ]]; then
            directorios+=("$DIR")
            homes_vistos["$DIR"]=1
        fi
    done < /etc/passwd

    while IFS= read -r filepath; do
        if [[ -n "$filepath" ]]; then
            echo "$filepath" >> "$OUTPUT"
            ((encontrado++))

            if (( encontrado >= 10 )); then
                exit 0
            fi
        fi
    done < <(find "${directorios[@]}" -type f -name "$PARAM" 2>/dev/null)
    
    sleep 1h
done





