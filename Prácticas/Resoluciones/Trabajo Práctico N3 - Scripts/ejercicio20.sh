#!/bin/bash
# Realice un script que simule el comportamiento de una estructura de PILA e
# implemente las siguientes funciones aplicables sobre una estructura global
# definida en el script:
# ➔​ push: Recibe un parámetro y lo agrega en la pila
# ➔​ pop: Saca un elemento de la pila
# ➔​ length: Devuelve la longitud de la pila
# ➔​ print: Imprime todos elementos de la pila

# declaro la pila como estructura global
pila=()

# funciones para el manejo de la pila
push() {
    if (( $# != 1 )); then
        echo "Modo de uso: push <elemento>"
        return 1
    fi
    pila+=("$1")
}

pop() {
    if (( ${#pila[@]} == 0 )); then
        echo "Operación inválida. La pila está vacía."
    else
        unset 'pila[-1]'
    fi
}

length() {
    echo "${#pila[@]}"
}

print() {
    for elem in "${pila[@]}"; do
        echo "$elem"
    done
}

# utilización de funciones
push "hola"
push 2
push "valen"
push "wiehl"
push 5
push 17
push "pera"
push "naranja"
push "22"
push "banana"

echo "Tamaño de la pila: $(length)" # 10 
echo
print

# popea los últimos 3
for i in {1..3}; do
    pop
done

echo
echo "Tamaño de la pila: $(length)" # 7
echo
print
