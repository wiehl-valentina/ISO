#!/bin/bash
# Realice un script que deberá recibir al menos
# 3 (tres) parámetros e imprima los valores recibidos
# en los parámetros, en el orden inverso al que el usuario
# los colocó.
#
# Para realizar correctamente se deberá importar una
# estructura Pila definida anteriormente y sus funciones.
# Si no recibe los parámetros indicar el uso del script.


# ** asumo que el script Parcial15-pila.sh se encuentra en el directorio actual
source ./Parcial15-pila.sh

if (( $# < 3 )); then
    echo "Se deben pasar al menos 3 parámetros"
    echo "Modo de uso: $0 <parametros>"
    exit 1
fi

# inicializa la pila
init

# pushea los elementos recibidos por parámetros
push "$@"

while ! is_empty; do 
    pop
done



