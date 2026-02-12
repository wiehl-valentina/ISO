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

#!/bin/bash

# declaración de la cola
QUEUE=()

# implementación de funciones
init() {
    QUEUE=()
}

push() {
    # valida el pasaje de parámetros
    if (( $# < 1 )); then
        echo "Error: es necesario pasar al menos un elemento como parámetro."
        return 1
    fi 
    for elem in "$@"; do 
        QUEUE+=("$elem")
    done
}

pop() {
    # valida que la cola tenga elementos para eliminar
    if (( "${#QUEUE[@]}" > 0 )); then
        echo "${QUEUE[0]}"
        QUEUE=("${QUEUE[@]:1}")
    else 
        echo "Error: no hay elementos para eliminar."
        return 1
    fi 
}

tail() {
    if (( "${#QUEUE[@]}" >= 1 )); then
        echo "${QUEUE[${#QUEUE[@]}-1]}"
    else
        echo "La cola no posee elementos."
        return 1
    fi
}

size() {
    echo "${#QUEUE[@]}"
}

list() {
    if (( "${#QUEUE[@]}" > 0 )); then
        echo "${QUEUE[@]}"
    else 
        echo "La cola no posee elementos."
        return 1
    fi
}

# inicializa la cola
init

# agrega los elemtos 1, 2, 6 y "hola" a la cola e imprime su contenido
push 1 2 6 "hola"
list

# imprime y elimina el primer elemento de la cola y luego muestra su contenido
pop
list

# muestra el tamaño de la cola
size

# muestra el último elemento de la cola
tail