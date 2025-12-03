#!/bin/bash
# find -pint0 --> imprime cada ruta separada con un byte nulo en vez de \n
# mapfile -d '' archivos --> lee la entrada y separa elementos por nulos
# < <() toma la salida de find como entrada para mapfile
# ** agrega los archivos .doc del directorio home a un arreglo
mapfile -d '' archivos < <(find /home -type f -name "*.doc" -print0) 

# implementación de funciones
verArchivo () {
    local arch="$1"
    for elem in "${archivos[@]}"; do
        if [[ "$elem" == "$arch" ]]; then
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
        if [[ "${archivos[i]}" == "$arch" ]]; then
            echo "¿Desea eliminar el archivo lógicamente? Y/N"
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