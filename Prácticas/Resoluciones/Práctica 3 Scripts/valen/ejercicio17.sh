#!/bin/bash 
echo "`ls | tr -d 'a' | tr '[:upper:][:lower:]' '[:lower:][:upper:]'`"