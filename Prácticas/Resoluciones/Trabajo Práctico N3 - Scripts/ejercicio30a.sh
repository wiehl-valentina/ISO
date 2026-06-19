#!/bin/bash
# se implementa un set haciendo uso de un array asociativo
# ** no importa realmente el valor sino las claves únicas

declare -Ag set

# implementación de funciones
initialize() {
    set=()
    return 0
}

initialize_with() {
    # valida pasaje de parámetros
    if (( $# >= 1 )); then
        # inicializa el set
        set=()
        # guarda los parámetros en un arreglo para iterarlos
        params=("$@")
        for elem in "${params[@]}"; do 
            set["$elem"]=1
        done
    else
        echo "Modo de uso: $0 <valor 1> <valor 2> ..."
        return 1
    fi
    return 0
}

add() {
    # si no recibe nada o recibe más de un parámetro, indica modo de uso
    if (( $# != 1 )); then
        echo "Modo de uso: $0 <valor>"
        return 1
    else 
        # si el elemento ya existe en el set, informa error
        if [[ -v set[$1] ]]; then
            return 1
        else
            set["$1"]=1
            return 0
        fi
    fi
}

remove() {
    # valida pasaje de parámetros
    if (( $# < 1 )); then
        echo "Modo de uso: $0 <valor1> <valor2> ..."
        return 1
    else
        # guarda los parámetros en un arreglo para iterarlos
        params=("$@")
        # inicializa contador para determinar el valor de retorno
        eliminados=0
        for elem in "${params[@]}"; do
            if [[ -v set[$elem] ]]; then
                unset set["$elem"]
                (( eliminados++ ))
            fi
        done
        if (( $eliminados == 0 )); then
            return 1
        fi
    fi
    return 0
}

contains() {
    # valida pasaje de parámetros
    if (( $# != 1 )); then
        echo "Modo de uso: $0 <valor>"
        return 1
    fi
    # valida si el valor existe en el set
    if [[ -v set[$1] ]]; then
        return 0
    fi
    return 1
}

print() {
    for elem in "${!set[@]}"; do
      echo "$elem"  
    done
}

print_sorted() {
    print | sort
}