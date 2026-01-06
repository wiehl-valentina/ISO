# Escribir un script en Bash que reciba como argumento una lista de nombres de usuario (debe validar que se reciba, al
# menos, uno) y, para cada uno de los usuarios válidos que se hayan recibido, deberá imprimir un reporte con la siguiente
# información:
# • Nombre de usuario.
# • Ruta al directorio personal, sólo si el usuario tiene directorio personal configurado y éste existe.
# • Cantidad de archivos (no directorios) en su directorio personal. Deberá informar 0 si el usuario no posee directorio
# personal o no existe

# valida el pasaje de parámetros
if (( $# < 1 )); then
    echo "Debe pasar al menos un parámetro."
    exit 1
fi

# para cada usuario chequea si existe y elabora el informe
for user in "$@"; do
    echo "Usuario: $user."
    CONSULTA=`getent passwd "$user"`
    if [ -n "$CONSULTA" ]; then
        HOME=$(echo "$CONSULTA" | cut -d: -f6)
        if [ -n "$HOME" ] && [ -d "$HOME" ]; then
            echo "Directorio personal: $HOME."
            ARCHIVOS=$(find "$HOME" -maxdepth 1 -type f | wc -l)
            echo "Cantidad de archivos: $ARCHIVOS"
        else
            echo "El usuario no tiene directorio personal."
            echo "Cantidad de archivos: 0."
        fi
    else
        echo "El usuario no existe."
        echo "Cantidad de archivos: 0."
    fi
    echo
done

    



