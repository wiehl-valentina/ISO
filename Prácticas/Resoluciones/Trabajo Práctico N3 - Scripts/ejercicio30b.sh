#!/bin/bash
# importo el script con las funciones del set
source ejercicio30a.sh

# declara el valor máximo por defecto 
# ** en realidad es 99, pero el $RANDOM toma el máximo como N-1
max=99

# valida el pasaje de parámetros
if (( $# == 1 )); then 
    if (( $1 > 0 && $1 <= 32767 )); then
        max=$1
    else
        echo "Error: valor máximo fuera de rango."
        exit 1
    fi
fi

sortear() {
    while true; do 
        # chequea que todavía haya bolillas sin repetir
        if (( ${#set[@]} == max + 1 )); then
            echo "No quedan más bolillas."
            break
        fi
        # agrega las bolillas al set para controlar que no se repitan e imprimirlas al final
        bolilla=$(( RANDOM % $(($max + 1)) )) # ** genera valor random entre 0 y 99
        # mientras la bolilla sorteada ya esté en el set, sigo sorteando
        while contains "$bolilla"; do
            bolilla=$(( RANDOM % $(($max + 1)) ))
        done
        # ** si sale del while la bolilla no es repetida, entonces la agrego al set
        add $bolilla
        # informa al usuario el número cantado
        echo "Bolilla: $bolilla"
        # espera el input del usuario para cantar bingo o seguir jugando
        read res
        echo
        case "${res,,}" in 
            y) 
                echo "¡BINGO!"
                echo
                echo "¡Felicitaciones! Ganaste el juego :)"
                break
                ;;
            n)
                ;;
        esac
    done
}

echo "¡BIENVENIDO AL BINGO!"
echo "--------------------"
echo "Al sortear una bolilla, debe ingresar Y para cantar bingo o N para seguir jugando"
echo
echo "Ingrese ENTER para comenzar..."
read
echo

while true; do
    echo "Comenzando el sorteo... ¡Mucha suerte!"
    # espera 3 segundos para continuar
    sleep 3
    # inicializa el set 
    initialize
    # sortea las bollillas
    sortear 
    # imprime las bolillas al finalizar la partida
    echo
    echo "Bolillas cantadas"
    echo "------------------"
    print_sorted
    echo
    echo "¿Desea jugar nuevamente? Y/N"
    read opcion
    case "${opcion,,}" in
        y) 
            ;;
        n)
            break
            ;;
    esac
done
        