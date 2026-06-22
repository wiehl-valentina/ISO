#!/bin/bash
# Realizá un script de Bash que almacene en un arreglo los nombres de todos
# los usuarios del sistema que tengan un patrón en su nombre de usuario.
#
# El patrón se recibe como parámetro del script.
#
# Una vez almacenados los usuarios en el arreglo, el script deberá presentar
# al usuario un menú que permita realizar las siguientes operaciones sobre
# la lista obtenida:
#
# - listar:
#   Lista en la salida estándar, de a uno por línea, los nombres de usuarios
#   que se encuentran actualmente en el arreglo.
#
# - eliminar:
#   Presenta la lista de usuarios junto con sus índices y luego le pide al
#   usuario que indique el índice del elemento que se desea eliminar del arreglo.
#
# - contar:
#   Presenta en la salida estándar la cantidad de elementos que actualmente
#   tiene el arreglo.
#
# Nota:
# Las operaciones deben implementarse como funciones que realicen las
# operaciones sobre el arreglo, validando los parámetros que recibe cuando
# fuera posible.

if (( $# != 1 )); then
    echo "Modo de uso: $0 <patrón>"
    exit 1
fi 

PATRON="$1"
USUARIOS=()

while IFS=: read -r USERNAME; do
    USUARIOS+=("$USERNAME")
done < <(cut -d: -f1 /etc/passwd | grep "$PATRON")

# funciones
listar() {
    for i in "${!USUARIOS[@]}"; do
        echo "$i - ${USUARIOS[$i]}"
    done
}

eliminar_usuario() {
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Error: debe ingresar un índice numérico válido."
        return 1
    fi
    if (( "$1" >= "${#USUARIOS[@]}" )); then
        echo "Error: índice fuera de rango."
        return 1
    fi
    unset 'USUARIOS[$1]'
    USUARIOS=("${USUARIOS[@]}")
}

contar() {
    echo "${#USUARIOS[@]}"
}


select opcion in Listar Eliminar Contar Salir; do 
    case $opcion in
        "Listar")
            listar
            echo
            ;;
        "Eliminar")
            listar
            echo
            read -p "Ingrese el índice: " index
            eliminar_usuario "$index"
            echo
            ;;
        "Contar")
            contar
            echo
            ;;
        "Salir")
            echo "Saliendo del programa..."
            break
            ;;
        *)
            echo "Opción inválida."
            echo
            ;;
    esac
done





