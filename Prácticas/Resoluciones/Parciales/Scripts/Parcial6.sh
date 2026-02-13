# Realice un script que liste en la salida estándar los nombres de
# los usuarios del sistema que tengan directorio personal configurado
# y que este exista en el filesystem.
#
# Si no encuentra ninguno, deberá terminar con un exit status de error.
#
# Ayuda:
# El campo 6 del archivo del sistema con información sobre los usuarios
# contiene la ruta del directorio personal configurado para cada usuario.

# boolean para saber si encontré al menos un usuario
encontre=0

echo "Usuarios con directorio personal configurado"
echo "--------------------------------"
echo

while IFS=: read -r USERNAME _ _ _ _ USER_HOME _; do
    if [[ -n "$USER_HOME" && -d "$USER_HOME" ]]; then
        echo "$USERNAME"
        encontre=1
    fi
done < /etc/passwd

if (( encontre == 0 )); then
    echo "No se encontraron usuarios con directorio personal configurado."
    exit 1
fi
