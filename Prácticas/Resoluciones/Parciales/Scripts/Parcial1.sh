# Realizar un script en Bash que, cada 1 hora, busque, en cada directorio home (y sus subdirectorios) de cada usuario del
# sistema, si el usuario contiene un archivo cuyo nombre es igual al parámetro que debe recibir el script. En caso de no
# encontrarse esta situación, se debe registrar, en un archivo de log llamado “archivo-encontrado<PARAMETRO>.log”
# (ubicado en el directorio correspondiente segun FHS), el full path del archivo encontrado. <PARAMETRO> representa el
# valor del parámetro que recibe el script. La ejecución del script finaliza retornando el codigo 0, una vez que se encontró,
# al menos, 10 veces el nombre del archivo entre todos los home de usuario. Se debe validar que el script recibe un único
# parámetro (que es el nombre del archivo a buscar) y, en caso contrario, debe imprimir un mensaje de error correspondiente
# y finalizar con el código de error 2

#!/bin/bash 

# valida el pasaje de parámetros
if (( #$ != 1 )); then
    echo "Parámetro inválido."
    echo "Modo de uso: $0 <param>"
    exit 2
fi 

# declara variables
ARCHIVO="$1"
LOG="var/log/archivo-encontrado${ARCHIVO}.log"
CONTADOR=0

# while que itera cada 60 minutos
while true; do 
    # recorre los directorios extraídos de /etc/passwd
    while IFS= read -r USER_HOME; do 
        # si el directorio no existe, saltea la iteración
        [ -d "$USER_HOME" ] || continue

        # recorre el directorio y sus subdirectorios buscando el archivo del parámetro
        while IFS= read -r ARCHIVO_ENCONTRADO; do
            echo "$ARCHIVO_ENCONTRADO" >> "$LOG"
            ((CONTADOR++))

            # si el archivo se encontró 10 veces, termina el script
            if (( "$CONTADOR" == 10 )); then
                exit 0
            fi 
        done < <(find "$USER_HOME" -type f -name "$ARCHIVO" 2>/dev/null)
    done < <(cut -d: -f6 /etc/passwd)

    # espera 1 hora para la próxima iteración de búsqueda
    sleep 3600
done

