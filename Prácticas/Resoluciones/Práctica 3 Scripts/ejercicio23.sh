#!/bin/bash

# declara los 2 vectores globales
vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

sumar() {
    # referencias a los parámetros
    local -n arreglo1=$1
    local -n arreglo2=$2
    # recorro ambos y voy sumando
    for i in "${!arreglo1[@]}"; do
        suma=$(( arreglo1[i] + arreglo2[i] ))
        echo "La suma de los elementos en la posición $i de los vectores es $suma"
    done 
}

sumar vector1 vector2