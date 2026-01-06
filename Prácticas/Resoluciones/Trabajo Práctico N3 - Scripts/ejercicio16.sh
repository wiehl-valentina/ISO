#!/bin/bash 
# chequea el pasaje de parámetros
if [ $# -ne 1 ]; then 
    echo "Modo de uso: $0 txt"
    exit 1
fi

EXT=$1
OUTPUT="reporte.txt"

# recorre los usuarios del sistema con carpeta en /home
for user in /home/*; do 
    # extrae el nombre del usuario
    usuario=$(basename "$user")
    
    # cuenta los archivos con la extensión pasada por parámetro
    cantidad=$(find "$user" -type f -name "*.$EXT" 2> /dev/null | wc -l)

    # imprime la salida en el archivo reporte.txt
    echo "$usuario  $cantidad" >> "$OUTPUT"
done
echo "Se generó el reporte en el archivo $OUTPUT"