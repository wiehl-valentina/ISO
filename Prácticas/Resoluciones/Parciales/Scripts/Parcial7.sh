# Escriba un script que reciba una cantidad desconocida de parámetros
# al momento de su invocación (debe validar que al menos se reciba uno).
#
# Cada parámetro representa la ruta absoluta de un archivo o directorio
# en el File System.
#
# El script deberá iterar por todos los parámetros recibidos:
#
# - Si el parámetro es un archivo existente en el File System:
#     deberá comprimirlo dejando el archivo comprimido
#     en lugar del original.
#
# - Si el parámetro es un directorio existente en el File System:
#     - Si tiene permiso de lectura deberá empaquetarlo y comprimirlo.
#     - Si tiene permiso de escritura deberá eliminarlo junto
#       con todo su contenido.
#
# - Si el parámetro no es un elemento del File System (no existe),
#     deberá contarlo e indicar la cantidad total al finalizar el script.

#!/bin/bash

# verifica cantidad de parámetros
if (( $# < 1 )); then
    echo "Modo de uso: $0 <param 1> <param 2> ... <param n>"
    exit 1
fi

NONEXISTENT=0

for elem in "$@"; do 
    # verifica si es un archivo 
    if [ -f "$elem" ]; then
        # si existe, lo comprime y eliminar el original
        # ** gzip borra el archivo original por defecto, para mantenerlo usar gzip -k archivo
        gzip "$elem"

        # informa el resultado
        if (( $? == 0 )); then 
            echo "El archivo $elem fue comprimido correctamente."
        else
            echo "Error al comprimir $elem." 
        fi
    # verifica si es un directorio
    elif [ -d "$elem" ]; then 
        # verifica si tiene permisos de lectura
        if [[ -r "$elem" ]]; then
            # empaqueta y comprime sin eliminar el original
            tar -czf "$elem.tar.gz" "$elem"

            if (( $? == 0 )); then
                echo "El directorio $elem se empaquetó y comprimió correctamente."
            else
                echo "Error al empaquetar y comprimir $elem."
            fi
        fi

        # verifica si tiene permisos de escritura
        if [[ -w "$elem" ]]; then
            # elimina el directorio y todo su contenido
            rm -r "$elem" 
        fi
    else
        ((NONEXISTENT++))
    fi
done 

echo "Cantidad de elementos inexistentes: $NONEXISTENT"
    



        

