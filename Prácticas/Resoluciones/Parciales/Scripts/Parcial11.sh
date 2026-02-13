# Escriba un script que reciba el path de un archivo por parámetro,
# debe validar que exista y, en caso afirmativo, informe qué permisos
# tiene el usuario sobre dicho archivo.
# En caso de tener permisos de ejecución, quitarlos.

#!/bin/bash

validar_parametros() {
    if (( $# != 1 )); then
        echo "Modo de uso: $0 <param 1>"
        exit 1
    fi  
}

quitar_ejecucion() {
    local ARCHIVO="$1"
    chmod u-x "$ARCHIVO"

    if (( $? == 0 )); then 
        echo "Permiso de ejecución eliminado."
    else
        echo "Error al quitar el permiso de ejecución."
    fi
}

validar_permisos() {
    local ARCHIVO="$1"
    [[ -r "$ARCHIVO" ]] && echo "El usuario tiene permiso de lectura."
    [[ -w "$ARCHIVO" ]] && echo "El usuario tiene permiso de escritura."
    if [[ -x "$ARCHIVO" ]]; then 
        echo "El usuario tiene permiso de ejecución."
        echo
        quitar_ejecucion "$ARCHIVO"
    fi
}

# valida los parámetros
validar_parametros "$@"

# verifica si existe y entonces valida permisos
ARCHIVO="$1"

if [ -f "$ARCHIVO" ]; then 
    validar_permisos "$ARCHIVO"
else 
    echo "El archivo no existe."
fi


