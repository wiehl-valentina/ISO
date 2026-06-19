#!/bin/bash
# Realizar un script que visualice por pantalla los números del 1 al 100 así
# como sus cuadrados.

# recorre e informa 
for i in {1..100}; do
    echo "$i | $((i * i))"
done