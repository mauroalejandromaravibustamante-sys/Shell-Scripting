#!/bin/bash

# ==============================================================================
# SCRIPT 4: Generación de Reporte en Texto Plano
# ==============================================================================

# Definir la ruta del reporte final
RUTA_REPORTE="./reporte_servidor.txt"

echo "Recopilando datos para el reporte..."

# # 1. Crear (o sobrescribir) el archivo con el encabezado usando '>'
echo "==================================================" > "$RUTA_REPORTE"
echo "           REPORTE DE RENDIMIENTO TI              " >> "$RUTA_REPORTE"
echo "==================================================" >> "$RUTA_REPORTE"
echo "Generado el : $(date)" >> "$RUTA_REPORTE"
echo "Servidor    : $(hostname)" >> "$RUTA_REPORTE"
echo "--------------------------------------------------" >> "$RUTA_REPORTE"

# # 2. Agregar información de Memoria RAM usando '>>' (Anexar)
echo "1. ESTADO DE LA MEMORIA RAM:" >> "$RUTA_REPORTE"
free -h >> "$RUTA_REPORTE"
echo "--------------------------------------------------" >> "$RUTA_REPORTE"

# # 3. Agregar información de carga promedio del procesador
echo "2. CARGA DEL SISTEMA (CPU):" >> "$RUTA_REPORTE"
uptime | awk -F'load average:' '{print "Promedio de carga:" $2}' >> "$RUTA_REPORTE"
echo "==================================================" >> "$RUTA_REPORTE"

echo "¡Reporte generado exitosamente!"
echo "Puedes revisar el resultado ejecutando: cat $RUTA_REPORTE"
