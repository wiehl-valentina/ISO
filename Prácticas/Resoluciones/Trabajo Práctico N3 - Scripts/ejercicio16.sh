#!/bin/bash 
# Realizar un script que reciba como parámetro una extensión y haga un reporte
# con 2 columnas, el nombre de usuario y la cantidad de archivos que posee con
# esa extensión. Se debe guardar el resultado en un archivo llamado reporte.txt

# chequea el pasaje de parámetros
if (( $# != 1 )); then 
    echo "Modo de uso: $0 extension"
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
    echo "$usuario | archivos $EXT: $cantidad" > "$OUTPUT"
done
echo "Se generó el reporte en el archivo $OUTPUT"