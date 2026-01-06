#!/bin/bash 
echo "`ls | tr -d 'aA' | tr '[:upper:][:lower:]' '[:lower:][:upper:]'`"