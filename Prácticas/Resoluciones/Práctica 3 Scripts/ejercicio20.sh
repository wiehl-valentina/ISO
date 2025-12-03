#!/bin/bash
# declaro la pila como estructura global
pila=()

# funciones para el manejo de la pila
push() {
    pila+=("$1")
}

pop() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "Operación inválida. La pila está vacía."
    else
        unset pila[$((${#pila[@]}-1))]
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
# agrega 10 elementos
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

# popea los últimos 3
for i in {1..3}; do
    pop
done

echo
echo "Tamaño de la pila: $(length)"
echo
print
