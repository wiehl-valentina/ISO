#!/bin/bash 

# declaro un arreglo 
num=(10 3 5 4 7 9 3 5 4) 

# función que chequea si el número es par
es_par() {
    if [ $(($1 % 2)) -eq 0 ]; then
        return 0
    else 
        return 1
    fi
}

recorrer() {
    local -n arreglo=$1
    local suma=0
    echo -n "El arreglo contiene los siguientes números pares: "
    for i in "${arreglo[@]}"; do 
        es_par i
        if [ $? -eq 0 ]; then
            echo -n "$i "
        else
            suma=$(( suma + 1 ))
        fi
    done
    echo
    echo "El arreglo contiene $suma números impares"
}   

recorrer num