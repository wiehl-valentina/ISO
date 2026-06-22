#!/bin/bash
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

USUARIOS=()

while IFS=: read -r USERNAME _ _ _ _ _ _; do 
    USUARIOS+=("$USERNAME")
done < /etc/passwd

existe() {
    if (( $# != 1 )); then
        echo "Modo de uso: existe <usuario>"
        return 2
    fi 

    for usuario in "${USUARIOS[@]}"; do
        if [[ "$usuario" == "$1" ]]; then
            return 0
        fi
    done
    
    return 1
}

eliminar_usuario() {
    if (( $# != 1 )); then
        echo "Modo de uso: eliminar_usuario <usuario>"
        return 1
    fi 

    if existe "$1"; then
        for i in "${!USUARIOS[@]}"; do
            if [[ "$1" == "${USUARIOS[$i]}" ]]; then
                unset "USUARIOS[$i]"
                USUARIOS=("${USUARIOS[@]}")
                return 0
            fi
        done
    fi
    return 2
}

usuarios_con_patron() {
    if (( $# != 1 )); then
        echo "Modo de uso: usuarios_con_patron <usuario>"
        return 1
    fi

    encontre=0
    for user in "${USUARIOS[@]}"; do
        if [[ "$user" == *"$1"* ]]; then
            encontre=1
            echo "$user"
        fi
    done 

    if (( encontre == 0 )); then
        return 102
    fi 

    return 0
}

cantidad() {
    if (( "${#USUARIOS[@]}" == 0 )); then
        return 95
    fi
    echo "${#USUARIOS[@]}"
}

usuarios() {
    if (( "${#USUARIOS[@]}" == 0 )); then
        return 95
    fi
    echo "${USUARIOS[@]}"
}