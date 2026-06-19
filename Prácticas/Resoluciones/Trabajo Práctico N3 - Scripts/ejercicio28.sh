#!/bin/bash
# Implemente un script que agregue a un arreglo todos los archivos del directorio
# /home cuya terminación sea .doc. 
# Adicionalmente, implemente las siguientes funciones que le permitan acceder a la estructura creada:
# ➢​ verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el
# mismo se encuentra en el arreglo. Caso contrario imprime el mensaje
# de error “Archivo no encontrado” y devuelve como valor de retorno 5
# ➢​ cantidadArchivos: Imprime la cantidad de archivos del /home con
# terminación .doc
# ➢​ borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere
# eliminar el archivo lógicamente. Si el usuario responde Si, elimina el
# elemento solo del arreglo. Si el usuario responde No, elimina el
# archivo del arreglo y también del FileSystem. Debe validar que el
# archivo exista en el arreglo. En caso de no existir, imprime el mensaje
# de error “Archivo no encontrado” y devuelve como valor de retorno 10


# find -print0 --> imprime cada ruta separada con un byte nulo en vez de \n
# mapfile -d '' archivos --> lee la entrada y separa elementos por nulos
# < <() toma la salida de find como entrada para mapfile
# ** agrega los archivos .doc del directorio home a un arreglo
mapfile -d '' archivos < <(find /home -type f -name "*.doc" -print0) 

# implementación de funciones
verArchivo () {
    if (( $# != 1 )); then
        echo "Modo de uso: verArchivo <nombre_archivo>"
        return 1
    fi

    local arch="$1"
    for elem in "${archivos[@]}"; do
        if [[ "$(basename "$elem")" == "$arch" ]]; then
            echo "`cat "$elem"`"
            return 0
        fi
    done
    echo "Error: Archivo no encontrado."
    return 5
}

cantidadArchivos() {
    echo "${#archivos[@]}"
}

eliminarElemento() {
    local indice=$1
    unset archivos[$indice]
    archivos=("${archivos[@]}")
    return 0
}

borrarArchivo() {
    local arch="$1"
    for i in "${!archivos[@]}"; do
        if [[ "$(basename "${archivos[i]}")" == "$arch" ]]; then
            echo "¿Desea eliminar el archivo lógicamente? y/n"
            read opcion
            case "${opcion,,}" in 
                y)
                    eliminarElemento $i
                    echo "El archivo fue eliminado del arreglo correctamente."
                    ;;
                n) 
                    rm "${archivos[$i]}"
                    eliminarElemento $i
                    echo "El archivo fue eliminado del arreglo y del directorio correctamente."
                    ;;
                *) 
                    echo "Opción inválida. Intente nuevamente."
                    ;;
            esac
            return 0; 
        fi
    done
    echo "Error: Archivo no encontrado."
    return 10
}

echo "Cantidad de archivos .doc en /home: $(cantidadArchivos)"
verArchivo "hola.doc"
borrarArchivo "arch3.doc"
echo "Cantidad de archivos .doc en /home: $(cantidadArchivos)"
