# Utilizando Bash, desarrolle las siguientes
# funciones para implementar una estructura de Pila
# (LIFO - Last In, First Out), la que deberá almacenarse
# en un arreglo:
#
#   • init: inicializa la pila vacía.
#   • push: agrega 1 o más elementos a la pila.
#   • pop: imprime el primer elemento de la pila,
#          removiéndolo de la misma.
#   • tail: imprime el último elemento de la pila sin
#           quitarlo de la misma.
#   • length: imprime la cantidad de elementos en la pila.
#
# Luego, realice un script que deberá recibir al menos
# 3 (tres) parámetros e imprima los valores recibidos
# en los parámetros, en el orden inverso al que el usuario
# los colocó.
#
# Para realizar correctamente se deberá importar una
# estructura Pila definida anteriormente y sus funciones.
# Si no recibe los parámetros indicar el uso del script.
#
# Recuerde validar en cada función que los parámetros
# y el estado de la pila sean adecuados para la operación
# que se intente realizar.

#!/bin/bash

PILA=()

empty() {
    if (( ${#PILA[@]} == 0 )); then
        echo "Error: la pila está vacía."
        return 0
    else 
        return 1
    fi
}

init() {
    PILA=()
}

push() {
    if (( $# == 0 )); then
        echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
        return 1
    fi 

    for elem in "$@"; do 
        PILA+=("$elem")
    done
}

pop() {
    if empty; then
        return 1
    fi 

    INDEX=$(( ${#PILA[@]} - 1 ))    
    echo "${PILA[$INDEX]}"
    PILA=("${PILA[@]:0:$INDEX}")
}

tail() {
    if empty; then 
        return 1
    fi

    echo "${PILA[0]}"
}

length() {
    echo "${#PILA[@]}"
}