#!/bin/bash
# solicita y lee los números
echo "Por favor ingrese dos números:"
read num1 num2

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