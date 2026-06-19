#!/bin/bash 
# Implemente un script que recorra un arreglo compuesto por números e imprima
# en pantalla sólo los números pares y que cuente sólo los números impares y los
# informe en pantalla al finalizar el recorrido.

num=(10 3 5 4 7 9 3 5 4) 

# función que chequea si el número es par
es_par() {
    if (( $(($1 % 2)) == 0 )); then
        return 0
    else 
        return 1
    fi
}

recorrer() {
    local suma=0
    echo -n "El arreglo contiene los siguientes números pares: "
    for i in "${num[@]}"; do 
        
        if es_par i; then
            echo -n "$i "
        else
            suma=$(( suma + 1 ))
        fi
    done
    echo
    echo "El arreglo contiene $suma números impares"
}   

recorrer 