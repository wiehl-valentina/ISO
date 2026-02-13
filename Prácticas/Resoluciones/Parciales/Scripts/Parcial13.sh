# Utilizando Bash, desarrolle las siguientes funciones para
#    implementar una estructura de cola FIFO (que deberá
#    almacenarse en un arreglo):
#
#    • init: inicializa la cola, no recibe argumentos.
#    • push: agrega uno o más elementos al final de la cola,
#            en el orden que son recibidos.
#    • pcp: devuelve el primer elemento de la cola,
#           quitándolo de la misma.
#    • tail: devuelve el último elemento de la cola,
#            pero no lo quita.
#    • size: devuelve el tamaño de la cola.
#    • list: devuelve todos los elementos que tiene la cola.
#
# Luego, escribir un cuerpo principal de script que utilice
# todas las funciones que implementó. El mismo deberá incluir
# comentarios indicando qué hace cada llamada.
#
# No hace falta que presente un menú, simplemente ejemplifique
# cómo se invoca cada una de las funciones.
#
# Recuerde validar en cada función que los parámetros y el
# estado de la cola FIFO sean adecuados para la operación
# que se intente realizar.

COLA=()

empty() {
    if (( ${#COLA[@]} == 0 )); then
        echo "Error: la cola está vacía."
        return 0
    else 
        return 1
    fi
}

init() {
    COLA=()
}

push() {
    if (( $# < 1 )); then
        echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
        return 1
    fi

    for elem in "$@"; do 
        COLA+=("$elem")
    done
}

pcp() {
    if empty; then
        return 1
    
    fi
    echo "${COLA[0]}"
    COLA=("${COLA[@]:1}")
}

tail() {
    if empty; then
        return 1
    fi
    local INDEX=$(( ${#COLA[@]} - 1 ))
    echo "${COLA[$INDEX]}"
}

size() {
    echo "${#COLA[@]}"
}

list() {
    if empty; then
        return 1
    else
        echo "${COLA[@]}"
    fi
}

# inicializa la cola
init

# agrega los valores 1, 3, 5 en la cola
push 1 3 5
# imprime 3 debido a que la cola posee 3 elementos
size 
# imprime los 3 elementos
list

# elimina el elemento en la posición 0 del arreglo e imprime cuál es
pcp 
# imprime los 2 elementos que quedan en la cola
list

# imprime el último elemento de la cola (en este caso 5)
tail