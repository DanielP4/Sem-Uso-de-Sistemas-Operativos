#!/bin/bash
echo "***************************************** Script create.sh **********************************************"
echo "Hola Mundo" > mytext.txt
echo "Creado el archivo mytext.txt"
echo "********************************************************************************************************"
echo "Contenido del archivo mytext.txt:"
cat mytext.txt
echo "********************************************************************************************************"
read -p "Presiona Enter para continuar..."
echo "********************************************************************************************************"
mkdir backup
echo "Creada carpeta backup"
echo "********************************************************************************************************"
cp mytext.txt backup
echo "Copiado archivo mytext.txt a backup"
echo "Contenido de la carpeta backup:"
ls backup
echo "********************************************************************************************************"
read -p "Presiona Enter para continuar..."
echo "********************************************************************************************************"
rm backup/mytext.txt
rmdir backup
echo "Eliminados el archivo mytext.txt y la carpeta backup."
echo "********************************************************************************************************"
read -p "Presiona Enter para salir..."
