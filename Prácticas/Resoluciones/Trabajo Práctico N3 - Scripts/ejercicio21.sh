#!/bin/bash
# Dada la siguiente declaración al comienzo de un script:
# num=(10 3 5 7 9 3 5 4)
# (la cantidad de elementos del arreglo puede variar).
# Implemente la función productoria dentro de este script, cuya tarea sea multiplicar
# todos los números que el arreglo contiene.

num=(10 3 5 7 9 3 5 4)

productoria() {
    local res=1
    for i in "${num[@]}"; do
        res=$(( res * i ))
    done
    echo $res
}

# imprime salida de la función
echo "Resultado: $(productoria)"