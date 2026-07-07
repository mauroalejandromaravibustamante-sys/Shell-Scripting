#!/bin/bash

# ==============================================================================
# SCRIPT 2: Limpieza Automatizada de Temporales
# ==============================================================================

# Definir el directorio objetivo (puedes cambiar esta ruta)
DIR_TEMPORAL="/tmp/cache_ti"

echo "Iniciando proceso de limpieza en: $DIR_TEMPORAL"

# Comprobación inicial: si no existe el directorio, lo creamos para la prueba
if [ ! -d "$DIR_TEMPORAL" ]; then
    echo "El directorio no existía. Creándolo y generando archivos de prueba..."
    mkdir -p "$DIR_TEMPORAL"
    touch "$DIR_TEMPORAL/log_antiguo1.tmp"
    touch "$DIR_TEMPORAL/log_antiguo2.tmp"
    touch "$DIR_TEMPORAL/archivo_importante.txt"
fi

# Contar cuántos archivos .tmp existen antes de limpiar
TOTAL_TMP=$(ls -1 "$DIR_TEMPORAL"/*.tmp 2>/dev/null | wc -l)
echo "Archivos temporales (.tmp) encontrados: $TOTAL_TMP"

# Automatización de la eliminación de archivos específicos (.tmp)
if [ "$TOTAL_TMP" -gt 0 ]; then
    echo "Eliminando archivos temporales..."
    rm -f "$DIR_TEMPORAL"/*.tmp
    echo "¡Limpieza completada con éxito!"
else
    echo "No se encontraron archivos temporales para eliminar."
fi
