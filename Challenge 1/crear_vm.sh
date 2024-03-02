#!/bin/bash

# Validar argumentos
if [ $# -ne 8 ]; then
  echo "Uso: $0 <Nombre> <SO> <CPUs> <RAM> <VRAM> <HDD> <NombreSATA> <NombreIDE>"
  exit 1
fi

# Definir variables
nombre="$1"
so="$2"
cpus="$3"
ram="$4"
vram="$5"
hdd="$6"
nombre_sata="$7"
nombre_ide="$8"

# Convertir RAM y HDD a megabytes
ram=$((ram * 1024))
hdd=$((hdd * 1024))


# Crear máquina virtual
VBoxManage createvm --name "$nombre" --ostype "$so" --register

# Configurar CPUs
VBoxManage modifyvm "$nombre" --cpus "$cpus"

# Configurar memoria RAM
VBoxManage modifyvm "$nombre" --memory "$ram"

# Configurar memoria de video
VBoxManage modifyvm "$nombre" --vram "$vram"

# Crear disco duro virtual
VBoxManage createhd --filename "$nombre.vdi" --size "$hdd" --format VDI

# Asociar disco duro virtual a la máquina virtual
VBoxManage storagectl "$nombre" --name "$nombre_sata" --add sata --controller IntelAhci --portcount 1
VBoxManage storageattach "$nombre" --storagectl "$nombre_sata" --port 0 --device "$nombre.vdi"

# Crear controlador IDE
VBoxManage storagectl "$nombre" --name "$nombre_ide" --add ide --controller PIIX4

# Asociar unidad óptica a la máquina virtual
VBoxManage storageattach "$nombre" --storagectl "$nombre_ide" --port 0 --device empty

# Imprimir resumen de la configuración
echo ""
echo "**Resumen de la configuración:**"
echo "Nombre: $nombre"
echo "SO: $so"
echo "CPUs: $cpus"
echo "RAM: $ram GB"
echo "VRAM: $vram MB"
echo "HDD: $hdd GB"
echo "Nombre del controlador SATA: $nombre_sata"
echo "Nombre del controlador IDE: $nombre_ide"

echo "**La máquina virtual '$nombre' se ha creado correctamente.**"
echo ""
