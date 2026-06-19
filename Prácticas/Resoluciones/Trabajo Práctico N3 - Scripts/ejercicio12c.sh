#!/bin/bash
# Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %.
# Esta calculadora debe funcionar recibiendo la operación y los números
# como parámetros

# controla el pasaje de parámetros
if (( $# != 3 )); then
    echo "Modo de uso: $0 num1 operación num2"
    echo "En caso de multiplicación: $0 num1 \* num2"
    exit 1
fi

# guarda el valor de los parámetros
num1=$1
num2=$3
op=$2

# informa resultado
echo "Resultado: $(($num1 $op $num2))"
