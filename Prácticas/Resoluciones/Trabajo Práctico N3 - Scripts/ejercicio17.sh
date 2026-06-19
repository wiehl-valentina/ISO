#!/bin/bash 
# Escribir un script que al ejecutarse imprima en pantalla los nombre de los
# archivos que se encuentran en el directorio actual, intercambiando minúsculas
# por mayúsculas, además de eliminar la letra a (mayúscula o minúscula).
# Por ejemplo, si en el directorio actual están los siguientes archivos:
# ➢​ IsO
# ➢​ pepE
# ➢​ Maria
# y ejecutó: ./ejercicio17 , se obtendrá como resultado:
# ➢​ iSo
# ➢​ PEPe
# ➢​ mRI
# Ayuda: Investigar el comando tr

echo "`ls | tr -d 'aA' | tr '[:upper:][:lower:]' '[:lower:][:upper:]'`"