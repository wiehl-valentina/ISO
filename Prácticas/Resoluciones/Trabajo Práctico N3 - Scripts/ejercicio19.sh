#!/bin/bash
# ubicación de los scripts
DIR="/home/valentina/shell-scripting"

# función para mostrar el menú
mostrar_menu() {
    echo MENU DE COMANDOS
    echo "----------------"
    echo "03. Ejercicio 3"
    echo "12a. Ejercicio 12 a"
    echo "12b. Ejercicio 12 b"
    echo "12c. Ejercicio 12c"
    echo "13a. Ejercicio 13a"
    echo "13b. Ejercicio 13b"
    echo "13c. Ejercicio 13c"
    echo "14. Ejercicio 14"
    echo "16. Ejercicio 16"
    echo "17. Ejercicio 17"
    echo "18. Ejercicio 18"
    echo "50. Salir"
    echo
    echo -n "Ingrese la opción que desea ejecutar:" 
} 

while true; do 
    mostrar_menu
    read opcion
    echo
    case "$opcion" in 
        03)
            echo "Ejecutando ejercico 3..."
            echo
            bash "$DIR/ejercicio3.sh"
            ;;
        12a) 
            echo "Ejecutando ejercico 12a..."
            echo
            bash "$DIR/ejercicio12a.sh"
            ;;
        12b)
            echo -n "Ingrese dos números:"
            read num1 num2
            echo "Ejecutando ejercico 12b..."
            echo
            bash "$DIR/ejercicio12b.sh" $num1 $num2
            ;;
        12c)
            echo "Para ejecutar este ejercicio es necesario ingresar una operación"
            echo "En el caso de multiplicación: 5 \* 8"
            echo -n "Ingrese una operación:"
            read num1 op num2
            echo "Ejecutando ejercico 12c..."
            echo
            bash "$DIR/ejercicio12c.sh" $num1 $op $num2 
            ;;
        13a)
            echo "Ejecutando ejercicio 13a..."
            echo
            bash "$DIR/ejercicio13a.sh"
            ;;
        13b)
            echo "Ejecutando ejercicio 13b..."
            echo
            bash "$DIR/ejercicio13b.sh"
            ;;
        13c)
            echo -n "Ingrese el nombre de un archivo:"
            read archivo
            echo "Ejecutando ejercicio 13c..."
            echo
            bash "$DIR/ejercicio13c.sh" $archivo
            ;;
        14)
            echo "MODO DE USO"
            echo "-a: renombra agregando el texto al final\n-b: renombra agregando el texto al principio"
            echo "Ejemplo: /tmp -a hola"
            echo
            echo -n "Ingrese un directorio, modo de operación y texto para renombrar"
            read dir flag str
            echo "Ejecutando ejercicio 14..."
            echo
            bash "$DIR/ejercicio14.sh" $dir $flag $str
            ;;
        16)
            echo -n "Ingrese una extensión, sin el punto:"
            read ext
            echo "Ejecutando ejercicio 16..."
            echo
            bash "$DIR/ejercicio16.sh" $ext
            ;;
        17)
            echo "Ejecutando ejercicio 17..."
            echo
            bash "$DIR/ejercicio17.sh"
            ;;
        18)
            echo -n "Ingrese un nombre de usuario:"
            read user
            echo "Ejecutando ejercicio 18..."
            echo
            bash "$DIR/ejercicio18.sh" $user
            ;;
        50) 
            echo "Cerrando el menú..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, intente nuevamente."
            ;;
    esac
    echo
    echo
    echo -n "Presione ENTER para volver al menú"
    read
done