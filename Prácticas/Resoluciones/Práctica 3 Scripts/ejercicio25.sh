#!/bin/bash
# validación de parámetros
if (( $# < 1 )); then
    echo "Error: debe pasarse al menos una ruta absoluta de un archivo como parámetro."
    exit 1
fi

# guarda los parámetros en un arreglo
params=("$@")
# inicia contador de archivos inexistentes
inexistentes=0

# iteración de los parámetros
for i in "${!params[@]}"; do 
    # debido a que el índice comienza en 0 y se necesita operar sobre los elementos
    # en posiciones impares (1, 3, 5), se debe trabajar sobre los índices pares
    if (( i%2 == 0 )); then
        # guarda el elemento dentro de la posición i (la ruta)
        ruta="${params[$i]}"
        # chequea existencia y tipo
        if [ -e $i ]; then
            if [ -f $i ]; then
                echo "$ruta es un archivo regular."
            elif [ -d $i ]; then
                echo "$ruta es un directorio."
            else 
                echo "$ruta existe pero no es un archivo regular ni un directorio."
            fi
        else
            ((inexistentes++))
        fi
    fi
done
echo "Cantidad de archivos inexistentes: $inexistentes"
exit 0
    

