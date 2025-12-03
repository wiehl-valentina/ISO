#!/bin/bash
# agrega los nombres de los usuarios del grupo users en usuarios_users
# gentent group users --> devuelve la línea del archivo /etc/passwd del grupo users --> users:x:100:juan,maria,luis
# awk -F: '{print $4}' --> divide en campos con : como referencia y se queda con el cuarto campo (juan, maria, luis)
# tr '.' ' ' --> reemplaza las , por espacios para que el arreglo interprete cada nombre como un elemento
usuarios_users=($(getent group users | awk -F: '{print $4}' | tr ',' ' '))

# chequea pasaje de parámetros para el caso -b n
if (( $# == 2 )); then
    # si son dos parámetros pero el primero no es -b, indica modo de uso
    if [[ $1 != "-b" ]]; then 
        echo "Modo de uso: $0 -b n"
        exit 1
    else 
        n=$2

        # chequea que n sea un número entero
        if ! [[ $n =~ ^[0-9]+$ ]]; then
            echo "Error: n debe ser un número entero"
            exit 1
        fi

        # parámetros correctos y el arreglo posee posición n, retorna el elemento en dicha posición
        if (( $n < "${#usuarios_users[@]}" )); then 
            echo "${usuarios_users[$n]}"
        # parámetros correctos y el arreglo no posee posición n, informa error
        else
            echo "Error: no existe la posición $n del arreglo"
            exit 1
        fi
        exit 0
    fi
fi

# chequea pasaje de parámetros para el caso de -l o -i
if (( $# == 1 )); then
    case "$1" in
        -l)
            echo "${#usuarios_users[@]}"
            ;;
        -i)
            for elem in "${usuarios_users[@]}"; do 
                echo "$elem"
            done
            ;;
        *)
            echo "Parámetro incorrecto."
            echo "$0 -l para conocer la longitud del arreglo"
            echo "$0 -i para imprimir los elementos del arreglo"
            exit 1
            ;;
    esac
    exit 0
else
    echo "MODO DE USO"
    echo "------------"
    echo 
    echo "$0 -b n | devuelve el elemento en la posición n del arreglo"
    echo "$0 -l | devuelve la longitud del arreglo"
    echo "$0 -i | imprime los elementos del arreglo"
    exit 1
fi





    