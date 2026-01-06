# Realizar un script en Bash que reciba una cantidad arbitraria de argumentos, de los cuales agregará a un arreglo sólo
# aquellos que sean números. Una vez armado el arreglo, deberá imprimir la sumatoria de todos los números que éste
# contenga. Para realizar esto, tiene a su disposición una función llamada is_number definida en el archivo
# /usr/lib/functions.sh, el cual deberá importar de manera adecuada en su script. La función recibe un argumento y retorna
# 0 si el argumento es un número y 1 en caso contrario.
# En su script, deberá implementar, al menos, y utilizar las siguientes funciones (no se debe acceder directamente al arreglo
# fuera de estas funciones):
# • init: inicializa el arreglo de números vacíos.
# • add_number: agrega un número, recibido como parámetro, al arreglo.
# • all_numbers: retorna todos los números que contiene el arreglo.
# • sum: retorna la sumatoria de todos los números que el arreglo contiene.

#!/bin/bash

# importa la función is_number
source /usr/lib/functions.sh

# implementación de funciones
NUMEROS=()

init() {
    NUMEROS=()
}

add_number() {
    NUMEROS+=("$1")
}

all_numbers() {
    echo "${NUMEROS[@]}"
}

sum() {
    local SUMA=0
    for elem in "${NUMEROS[@]}"; do 
        (( SUMA += elem ))
    done
    echo "$SUMA"
}

# inicializa el arreglo
init 

# valida parámetros y carga el arreglo
for elem in "$@"; do 
    if is_number "$elem"; then
        add_number "$elem"
    fi 
done

# acumula el contenido del arreglo
sum
