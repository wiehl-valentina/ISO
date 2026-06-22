#!/bin/bash
# Utilizando Bash, desarrolle las siguientes funciones para implementar una estructura de cola FIFO (que deberá
# almacenarse en un arreglo):
# • init: inicializa la cola, no recibe argumentos.
# • push: agrega uno o más elementos al final de la cola, en el orden que son recibidos.
# • pop: devuelve el primer elemento de la cola, quitándolo de la misma.
# • tail: devuelve el último elemento de la cola, pero no lo quita.
# • size: devuelve el tamaño de la cola.
# • list: devuelve todos los elementos que tiene la cola.
# Luego, escriba un cuerpo principal de script que utilice todas las funciones que implementó. El mismo deberá incluir
# comentarios indicando qué hace cada llamado. No hace falta que presente un menú, simplemente ejemplifique cómo se
# invoca cada una de las funciones. Recordar validar, en cada función, que los parámetros y el estado de la cola FIFO sean
# adecuados para la operación que se intente realizar.

declare -a queue 

init() {
    queue=()
}

push() {
    if (( $# == 0 )); then
        echo "Modo de uso: push <elementos>"
        return 1
    fi 

    queue+=("$@")
    return 0
}

is_empty() {
    if (( "${#queue[@]}" == 0)); then
        return 0
    fi
    return 1
}

pop() {
    if is_empty; then
        echo "Error: la cola está vacía."
        return 1
    fi
    echo "${queue[0]}"
    unset queue[0]
    queue=("${queue[@]}")
}

tail() {
    if is_empty; then
        echo "Error: la cola está vacía."
        return 1
    fi
    echo "${queue[-1]}"
}

size() {
    echo "${#queue[@]}"
}

list() {
    if is_empty; then
        echo "Error: la cola está vacía."
        return 1
    fi
    echo "${queue[@]}"
}

init 
push "arctic monkeys"
tail
size
list
push "tame impala" "the strokes"
list
pop
list
tail
size
