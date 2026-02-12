# Realice un script que agregue todos los nombres de usuario del sistema
# a un arreglo e implemente las siguientes funciones:
#
# existe <parametro1>:
#     Devuelve 0 si el usuario existe en el arreglo.
#     En caso contrario devuelve 1.
#
# eliminar_usuario <parametro1>:
#     Si el usuario pasado como parámetro existe en el arreglo
#     lo elimina del mismo.
#     Caso contrario devuelve código de error 2.
#
# usuarios_con_patron <parametro1>:
#     Recorre el arreglo e imprime en pantalla los nombres
#     de los usuarios que contengan el patrón pasado como parámetro.
#     Si no encuentra ninguno devuelve código de error 102.
#
# cantidad:
#     Imprime la cantidad total de usuarios en el arreglo.
#     Si está vacío devuelve el código de error 95.
#
# usuarios:
#     Imprime todos los nombres de los usuarios que están en el arreglo.
#     Si está vacío devuelve el código de error 95.

#!/bin/bash

# agrega los nombres de usuario al arreglo
USUARIOS=()

while IFS=: read -r USER _ _ _ _ _ _; do 
    USUARIOS+=("$USER")
done < /etc/passwd

# implementación de funciones

validar() {
    if (( $# != 1 )); then
        echo "Modo de uso: $0 <param 1>"
        return 1
    else 
        return 0
    fi
}

existe() {
    # actúa dependiendo si el nro de parámetros es válido
    if validar "$@"; then
        local USER="$1"
        for elem in "${USUARIOS[@]}"; do 
            if [[ "$elem" == "$USER" ]]; then
                return 0
            fi
        done
        return 1
    else
        return 2
    fi
}

eliminar_usuario() {
    # actúa dependiendo si el nro de parámetros es válido
    if existe "$@"; then
        local USER="$1"
        for i in "${!USUARIOS[@]}"; do
            if [[ "${USUARIOS[$i]}" == "$USER" ]]; then
                unset USUARIOS[$i]
                return 0
            fi
        done 
    fi
    return 2
}

usuarios_con_patron() {
    local encontre=0
    if validar "$@"; then
        local PATRON="$1"
        for elem in "${USUARIOS[@]}"; do 
            if [[ "$elem" == *"$PATRON"* ]]; then
                echo "$elem"
                encontre=1
            fi
        done
    fi

    # verifico código de retorno
    if (( encontre == 0)); then
        return 102
    fi
        
    return 0
}

cantidad() {
    if (( ${#USUARIOS[@]} > 0 )); then
        echo "${#USUARIOS[@]}"
    else
        return 95
    fi
}

usuarios() {
    if (( ${#USUARIOS[@]} > 0 )); then
        echo "${USUARIOS[@]}"
    else
        return 95
    fi
}