#!/bin/bash
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

source /usr/lib/functions.sh

if (( $# == 0 )); then
    echo "Modo de uso: $0 <param1> ..."
    exit 1
fi 

declare -a numeros

init() {
    numeros=()
}

add_number() {
    if (( $# != 1 )); then
        echo "Modo de uso: add_numer <número>"
        return 1
    fi

    numeros+=("$1")
    return 0
}

all_numbers() {
    echo "${numeros[@]}"
}

sum() {
    resultado=0
    for num in "${numeros[@]}"; do
        (( resultado += num ))
    done
    echo "$resultado"
}

init 

for param in "$@"; do
    if is_number "$param"; then
        add_number "$param"
    fi
done

all_numbers

echo "La sumatoria de los números es: $(sum)"
exit 0
