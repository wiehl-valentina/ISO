#!/bin/bash

# declara un arreglo 
num=(10 3 5 7 9 3 5 4)

productoria() {
    local -n arreglo=$1
    local res=1
    for i in "${arreglo[@]}"; do
        res=$(( res * i ))
    done
    echo $res
}

# imprime salida de la función
echo "Resultado: $(productoria num)"