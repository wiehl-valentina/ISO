#!/bin/bash
# Realizar un script que le solicite al usuario 2 números, los lea de la entrada
# Standard e imprima la multiplicación, suma, resta y cual es el mayor de los
# números leídos. 

# solicita y lee los números
echo "Por favor ingrese dos números:"
read num1 num2

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
