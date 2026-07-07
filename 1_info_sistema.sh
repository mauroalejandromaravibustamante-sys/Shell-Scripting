#!/bin/bash

# ==============================================================================
# SCRIPT 1: Variables e Información Básica
# ==============================================================================

# Definición de variables capturando comandos del sistema
USUARIO_ACTUAL=$(whoami)
VERSION_KERNEL=$(uname -r)
ARQUITECTURA=$(uname -m)
FECHA_SISTEMA=$(date +"%Y-%m-%d %H:%M:%S")
TIEMPO_ENCENDIDO=$(uptime -p)

# Mostrar la información en pantalla utilizando las variables
echo "=========================================================="
echo "          INFORMACIÓN BÁSICA DEL SISTEMA                  "
echo "=========================================================="
echo "Usuario actual    : $USUARIO_ACTUAL"
echo "Versión del Kernel: $VERSION_KERNEL"
echo "Arquitectura      : $ARQUITECTURA"
echo "Fecha y Hora      : $FECHA_SISTEMA"
echo "Tiempo encendido  : $TIEMPO_ENCENDIDO"
echo "=========================================================="
