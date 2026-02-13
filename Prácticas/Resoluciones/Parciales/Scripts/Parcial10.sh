# Utilizando Bash, desarrolle las siguientes funciones para implementar
# una estructura de LISTA, la que deberá almacenarse en un arreglo.

# - init:
#     Inicializa la lista.
#     Puede recibir 0 o más parámetros que representen elementos
#     iniciales para la lista.
#
# - push:
#     Agrega 1 o más elementos al final de la lista.
#
# - last:
#     Devuelve el último elemento de la lista,
#     quitándolo de la misma.
#
# - first:
#     Devuelve el primer elemento de la lista,
#     quitándolo de la misma.
#
# - size:
#     Devuelve el tamaño de la lista
#     (cantidad de elementos en la misma).
#
# - print:
#     Imprime todos los elementos de la lista.
#
# Luego, escriba un cuerpo principal del script que cree una lista L
# sin elementos y utilice todas las funciones anteriores sobre L.
# No hace falta que presente un menú, simplemente ejemplifique
# cómo se invoca cada una de las funciones.
# Recuerde validar en cada función que los parámetros y el estado
# de la lista sean adecuados para la operación que se intente realizar.

#!/bin/bash

LISTA=()

push() {
    if (( $# < 1 )); then
        echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
        return 1
    fi

    for param in "$@"; do
        LISTA+=("$param")
    done
}

init() {
    LISTA=()

    if (( $# > 0 )); then
        push "$@"
    fi
}

size() {
    echo "${#LISTA[@]}"
}

vacia() {
    if (( "${#LISTA[@]}" == 0 )); then
        return 0
    fi
    return 1
}

last() {    
    if vacia; then
        echo "Error: lista vacía."
        return 1
    fi
    local INDEX=$(( ${#LISTA[@]} - 1 ))
    echo "${LISTA[$INDEX]}"
    unset LISTA[$INDEX]
}

first() {
    if vacia; then
        echo "Error: lista vacía."
        return 1
    fi
    echo "${LISTA[0]}"
    LISTA=("${LISTA[@]:1}")
}

print() {
    if vacia; then
        echo "La lista está vacía."
        return 1
    fi
    echo "${LISTA[@]}"
}

# programa principal

init 1 3 5
size

push 7 9 11
size

first
print

last 
print