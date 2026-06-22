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

declare -a COLA

is_empty() {
    if (( ${#COLA[@]} == 0 )); then
        return 0
    fi
    return 1
}

init() {
    if (($# != 0 )); then
        echo "Error: la función no acepta parámetros."
        return 1
    fi 
    COLA=()
}

push() {
    if (( $# == 0 )); then
        echo "Modo de uso: push <elemento1> <elemento2> ..."
        return 1
    fi 
    COLA+=("$@")
}

pcp() {
    if is_empty; then
        echo "Error: la cola está vacía."
        return 1
    fi
    echo "${COLA[0]}"
    unset 'COLA[0]'
    COLA=("${COLA[@]}")
}

tail() {
    if is_empty; then
        echo "Error: la cola está vacía."
        return 1
    fi
    echo "${COLA[-1]}"
}

size() {
    echo "${#COLA[@]}"
}

list() {
    if is_empty; then
        echo "La cola está vacía."
        return 1
    fi
    echo "${COLA[@]}"
}

init
push "arctic monkeys" "the strokes"
list
tail
size
pcp
list
size
