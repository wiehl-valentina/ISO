#!/bin/bash
# Realice un script que reciba como parámetro el nombre de un directorio. 
# Deberá validar que el mismo exista y de no existir causar la terminación del script con
# código de error 4. Si el directorio existe deberá contar por separado la cantidad
# de archivos que en él se encuentran para los cuales el usuario que ejecuta el
# script tiene permiso de lectura y escritura, e informar dichos valores en pantalla.
# En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán
# ser tenidos en cuenta para la suma a informar.

# chequea pasaje de parámetro
if (( $# != 1 )); then
    echo "Modo de uso: $0 <directorio>"
    exit 1
fi

# valida la existencia del directorio
if ! [[ -d "$1" ]]; then
    echo "Error: el directorio no existe."
    exit 4
fi

# función para sumar los archivos
contar_archivos() {
    local directorio="$1"
    local lectura=0
    local escritura=0

    for archivo in "$directorio"/*; do 
        if [[ -f "$archivo" ]]; then
            if [[ -r "$archivo" ]]; then
                ((lectura++))
            fi

            if [[ -w "$archivo" ]]; then
                ((escritura++))
            fi
        fi 
    done

    echo "Cantidad de archivos con permiso de lectura: $lectura"
    echo "Cantidad de archivos con permiso de escritura: $escritura"
}

# si el archivo existe, llama a la función
contar_archivos "$1"


