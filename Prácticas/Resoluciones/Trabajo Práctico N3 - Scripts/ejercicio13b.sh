#!/bin/bash
select opcion in Listar DondeEstoy QuienEsta; do
    case $opcion in
        "Listar")
            echo "`ls`"
            break
            ;;
        "DondeEstoy")
            echo "`pwd`"
            break
            ;;
        "QuienEsta")
            echo "`users`"
            break
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
done
