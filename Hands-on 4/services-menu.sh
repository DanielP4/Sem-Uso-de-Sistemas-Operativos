#!/bin/bash

# Listar el contenido de una carpeta
listar_contenido() {
    read -p "Ingrese la ruta absoluta de la carpeta: " ruta
    echo " "
    echo "Contenido de la carpeta:"
    ls "$ruta"
}

# Crear un archivo de texto con una línea de texto
crear_archivo() {
    read -p "Ingrese la cadena de texto a almacenar en el archivo: " texto
    echo "$texto" > archivo_creado.txt
    echo ""
    echo "Archivo creado con éxito."
}

# Comparar dos archivos de texto
comparar_archivos() {
    read -p "Ingrese la ruta absoluta al primer archivo: " archivo1
    echo ""
    read -p "Ingrese la ruta absoluta al segundo archivo: " archivo2
    echo ""
    diff "$archivo1" "$archivo2"
}

# Mostrar el uso del comando awk
uso_awk() {
    echo "Awk es un lenguaje de script utilizado para manipular datos y generar informes."
    echo " "
    echo "Ejemplos de uso de awk:"
    echo " "
    echo "1. Imprimir los datos de un archivo CSV:"
    echo "awk '{print NR,\$0}' datos.csv"
    echo ""
    awk '{print NR,$0}' datos.csv
    echo " "
    echo "2. Filtrar filas en base a un criterio (Edad > 30):"
    echo "awk -F',' '\$2 > 30' datos.csv"
    echo ""
    awk -F',' '$2 > 30' datos.csv
    echo " "
    echo "3. Calcular el promedio de la columna Edad:"
    echo "awk -F',' '{suma += \$2} END {print suma/NR}' datos.csv"
    echo ""
    awk -F',' '{suma += $2} END {print suma/NR}' datos.csv
    echo " "
}

# Mostrar el uso del comando grep
uso_grep() {
    echo "El comando grep es una poderosa herramienta usada para la busqueda"
    echo "y manipulacion de patrones de texto dentro de archivos."
    echo " "
    echo "Ejemplos de uso de grep:"
    echo " "
    echo "1. Buscar una cadena en un archivo de texto:"
    echo "grep 'programación' archivo.txt"
    echo ""
    grep 'programación' archivo.txt
    echo " "
    echo "2. antidad de lineas en las que aparece la cadena:"
    echo "grep -c 'programación' archivo.txt"
    echo ""
    grep -c 'programación' archivo.txt
    echo " "
    echo "3. Mostrar las lineas en las que no aparece la cadena:"
    echo "grep -v 'programación' archivo.txt"
    echo ""
    grep -v 'programación' archivo.txt
}

# Función principal para mostrar el menú
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un fichero o carpeta."
    echo "2. Crear un archivo de texto con una línea de texto."
    echo "3. Comparar dos archivos de texto."
    echo "4. Uso del comando awk."
    echo "5. Uso del comando grep."
    echo "6. Salir."
}

# Bucle principal
while true; do
    clear
    mostrar_menu
    echo ""
    read -p "Ingrese su opción (1-6): " opcion
    echo ""
    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "Saliendo del programa." && exit ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac
    echo ""
    read -p "Presiona Enter para continuar..."
done
