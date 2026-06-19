#!/bin/bash
# Realice un script que implemente a través de la utilización de funciones las
# operaciones básicas sobre arreglos:
# ➢​ inicializar: Crea un arreglo llamado array vacío
# ➢​ agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
# ➢​ eliminar_elem <parametro1>: Elimina del arreglo el elemento que se
# encuentra en la posición recibida como parámetro. Debe validar que se reciba una posición válida
# ➢​ longitud: Imprime la longitud del arreglo en pantalla
# ➢​ imprimir: Imprime todos los elementos del arreglo en pantalla
# ➢​ inicializar_Con_Valores <parametro1> <parametro2>: Crea un arreglo
# con longitud <parametro1> y en todas las posiciones asigna el valor <parametro2>

declare -a array

inicializar() {
    array=()
}

agregar_elem() {
    if (( $# != 1 )); then
        echo "Modo de uso: agregar_elem <elemento>"
        return 1
    fi
    array+=("$1")
}

eliminar_elem() {
    if (( $# != 1 )); then
        echo "Modo de uso: eliminar_elem <posición>"
        return 1
    fi

    if (( $1 < 0 || $1 >= "${#array[@]}" )); then
        echo "Error: posición inválida."
        return 2
    else 
        unset array[$1]
        array=("${array[@]}")
        return 0
    fi
}

longitud() {
    echo "${#array[@]}"
}

imprimir() {
    echo "${array[@]}"
}

inicializar_con_valores() {
    if (( $# != 2 )); then
        echo "Modo de uso: inicializar_con_valores <longitud> <valor>"
        return 1
    fi

    local longitud=$1
    local valor=$2

    if ! [[ $longitud =~ ^[0-9]+$ ]] || (( longitud < 0 )); then
        echo "Error: la longitud debe ser un número natural"
        return 2
    fi

    # inicializo arreglo vacío
    array=()

    # lo recorro agregando el valor
    for (( i=0; i<longitud; i++ )); do 
        array+=("$valor")
    done
}

inicializar
agregar_elem "valen"
agregar_elem 24
longitud
imprimir

echo 
echo

inicializar_con_valores 3 "valen" 
imprimir