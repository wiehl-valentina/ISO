#!/bin/bash
# Modificar el script creado en el inciso anterior para que los números sean
# recibidos como parámetros. El script debe controlar que los dos
# parámetros sean enviados.

# controla el envío de parámetros
if (( $# != 2 )); then
    echo "Modo de uso: $0 num1 num2"
    exit 1
fi

# guarda el valor de los parámetros
num1=$1
num2=$2

# informa operaciones
echo "Suma: $((num1 + num2))"
echo "Resta: $((num1 - num2))"
echo "Multiplicación: $((num1 * num2))"

# chequea cuál es el mayor e imprime
if (( $num1 > $num2 )); then
    echo "Número mayor: $num1"
else
    echo "Número mayor: $num2"
fi