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

#!/bin/bash

# valida el pasaje de parámetros para que contenga un solo patrón de búsqueda
if (( $# != 1 )); then
    echo "Modo de uso: $0 <patrón>"
    exit 1
fi

# declaración de variables
PATRON="$1"
USUARIOS=()

# itera los nombres de usuario que coinciden con el patrón y los agrega al arreglo
while IFS= read -r USER; do
    USUARIOS+=("$USER")
done < <(cut -d: -f1 /etc/passwd | grep "$PATRON")

# implementación de funciones
listar() {
    # valida que haya usuarios para listar
    if (( ${#USUARIOS[@]} == 0 )); then
        echo "No hay usuarios en el arreglo."
        return 1
    fi
        
    for user in "${USUARIOS[@]}"; do
        echo "$user"
    done
}


eliminar() {
    #valida que haya usuarios para eliminar
    if (( ${#USUARIOS[@]} == 0 )); then
        echo "No hay usuarios para eliminar."
        return 1
    fi

    for i in "${!USUARIOS[@]}"; do
        echo "$i - ${USUARIOS[$i]}"
    done
    
    # soiicita al usuario un índice a eliminar y verifica que sea válido
    read -p "Ingrese el índice a eliminar: " indice
    if [[ ! "$indice" =~ ^[0-9]+$ ]] || (( indice < 0 || indice >= ${#USUARIOS[@]} )); then
        echo "Índice inválido."
        return 1
    fi

    unset USUARIOS[$indice]
    USUARIOS=("${USUARIOS[@]}")
    echo "Usuario eliminado correctamente."
}

contar() {
    echo "Cantidad de usuarios: ${#USUARIOS[@]}"
}

# implementación del menu
PS3="Seleccione una opción: "
select opcion in listar eliminar contar salir; do 
    case "$opcion" in
        listar) 
            listar
        ;;
        eliminar)
            eliminar
            ;;
        contar)
            contar
            ;;
        salir)
            echo
            echo "Cerrando el menu..."
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
done