#!/bin/bash

inicializar() {
    array=()
}

agregar_elem() {
    array+=("$1")
}

eliminar_elem() {
    if (( $1 < 0 || $1 >= "${#array[@]}" )); then
        echo "Error: posición inválida."
    else 
        unset array[$1]
        array=("${array[@]}")
    fi
}

longitud() {
    echo "${#array[@]}"
}

imprimir() {
    for elem in "${array[@]}"; do
        echo "$elem"
    done
}

inicializar_con_valores() {
    local longitud=$1
    local valor=$2

    if ! [[ $longitud =~ ^[0-9]+$ ]] || (( longitud < 0 )); then
        echo "Error: la longitud debe ser un número natural"
        return 1
    fi

    # inicializo arreglo vacío
    array=()

    # lo recorro agregando el valor
    for (( i=0; i<longitud; i++ )); do 
        array+=("$valor")
    done
}