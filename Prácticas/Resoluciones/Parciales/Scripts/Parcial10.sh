#!/bin/bash
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

declare -a LISTA

init() {
    LISTA=("$@")
}

push() {
    if (( $# == 0 )); then
        echo "Modo de uso: push <elementos>"
        return 1
    fi

    for elem in "$@"; do
        LISTA+=("$elem")
    done
    return 0
}

is_empty() {
    if (( "${#LISTA[@]}" == 0 )); then
        return 0
    fi
    return 1
}

last() {
    if is_empty; then
        echo "Error: la lista está vacía."
        return 1
    fi
    echo "${LISTA[-1]}"
    unset 'LISTA[-1]'
    LISTA=("${LISTA[@]}")
    return 0
}

first() {
    if is_empty; then
        echo "Error: la lista está vacía."
        return 1
    fi
    echo "${LISTA[0]}"
    unset 'LISTA[0]'
    LISTA=("${LISTA[@]}")
    return 0
}

size() {
    echo "${#LISTA[@]}"
}

print() {
    echo "${LISTA[@]}"
}

init
push "arctic monkeys" "the strokes" "abba"
print
size
first
print
last
print
size

