#!/bin/bash
# controla el envío de parámetros
if [ $# -ne 2 ]; then
    echo "Modo de uso: $0 num1 num2"
    exit 1
fi

# guarda el valor de los parámetros
num1=$1
num2=$2

# informa operaciones
echo "Suma: $(($num1 + $num2))"
echo "Resta: $(($num1 - $num2))"
echo "Multiplicación: $(($num1 * $num2))"

# chequea cuál es el mayor e imprime
if (( $num1 > $num2 )); then
    mayor=$num1
else
    mayor=$num2 
fi
echo "Número mayor: $mayor"