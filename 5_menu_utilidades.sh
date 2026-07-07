#!/bin/bash

# ==============================================================================
# Variables globales
# ==============================================================================
# Límite por defecto para el disco (heredado del script de monitoreo)
LIMITE_DISCO=80

# ==============================================================================
# Bucle del Menú Principal
# ==============================================================================
while true; do
    echo "=========================================================="
    echo "                 MENÚ PRINCIPAL DE UTILIDADES             "
    echo "=========================================================="
    echo "1) Mostrar Información Básica del Sistema"
    echo "2) Limpieza Automatizada de Temporales"
    echo "3) Monitoreo de Almacenamiento (Submenú)"
    echo "4) Generación de Reporte en Texto Plano"
    echo "5) Salir del programa"
    echo "=========================================================="
    
    read -p "Selecciona una opción [1-5]: " OPCION_PRINCIPAL
    echo "----------------------------------------------------------"

    case $OPCION_PRINCIPAL in
        1)
            # ------------------------------------------------------------------
            # Módulo 1: Información Básica
            # ------------------------------------------------------------------
            USUARIO_ACTUAL=$(whoami)
            VERSION_KERNEL=$(uname -r)
            ARQUITECTURA=$(uname -m)
            FECHA_SISTEMA=$(date +"%Y-%m-%d %H:%M:%S")
            TIEMPO_ENCENDIDO=$(uptime -p)

            echo "=========================================================="
            echo "          INFORMACIÓN BÁSICA DEL SISTEMA                  "
            echo "=========================================================="
            echo "Usuario actual    : $USUARIO_ACTUAL"
            echo "Versión del Kernel: $VERSION_KERNEL"
            echo "Arquitectura      : $ARQUITECTURA"
            echo "Fecha y Hora      : $FECHA_SISTEMA"
            echo "Tiempo encendido  : $TIEMPO_ENCENDIDO"
            echo "=========================================================="
            ;;
            
        2)
            # ------------------------------------------------------------------
            # Módulo 2: Limpieza Automatizada
            # ------------------------------------------------------------------
            DIR_TEMPORAL="/tmp/cache_ti"
            echo "Iniciando proceso de limpieza en: $DIR_TEMPORAL"

            if [ ! -d "$DIR_TEMPORAL" ]; then
                echo "El directorio no existía. Creándolo y generando archivos de prueba..."
                mkdir -p "$DIR_TEMPORAL"
                touch "$DIR_TEMPORAL/log_antiguo1.tmp"
                touch "$DIR_TEMPORAL/log_antiguo2.tmp"
                touch "$DIR_TEMPORAL/archivo_importante.txt"
            fi

            TOTAL_TMP=$(ls -1 "$DIR_TEMPORAL"/*.tmp 2>/dev/null | wc -l)
            echo "Archivos temporales (.tmp) encontrados: $TOTAL_TMP"

            if [ "$TOTAL_TMP" -gt 0 ]; then
                echo "Eliminando archivos temporales..."
                rm -f "$DIR_TEMPORAL"/*.tmp
                echo "¡Limpieza completada con éxito!"
            else
                echo "No se encontraron archivos temporales para eliminar."
            fi
            ;;
            
        3)
            # ------------------------------------------------------------------
            # Módulo 3: Monitoreo de Almacenamiento (Submenú)
            # ------------------------------------------------------------------
            while true; do
                echo "=================================================="
                echo "       MENÚ DE MONITOREO DE ALMACENAMIENTO        "
                echo "=================================================="
                echo "1) Verificar uso del disco raíz (/)"
                echo "2) Configurar límite de alerta (Actual: $LIMITE_DISCO%)"
                echo "3) Regresar al menú principal"
                echo "=================================================="

                read -p "Selecciona una opción [1-3]: " OPCION_SUB
                echo "--------------------------------------------------"

                case $OPCION_SUB in
                    1)
                        echo "[*] Verificando estado del almacenamiento en '/'..."
                        USO_DISCO=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

                        if [ "$USO_DISCO" -ge "$LIMITE_DISCO" ]; then
                            echo "    -> [ADVERTENCIA] Uso crítico del disco: $USO_DISCO%."
                            echo "    -> Acción requerida: Liberar espacio."
                        else
                            echo "    -> [OK] El uso del disco es del $USO_DISCO%. (Normal)."
                        fi
                        ;;
                    2)
                        read -p "Ingresa el nuevo porcentaje límite (ej. 90): " NUEVO_LIMITE

                        if [[ "$NUEVO_LIMITE" =~ ^[0-9]+$ ]]; then
                            LIMITE_DISCO=$NUEVO_LIMITE
                            echo "    -> [ÉXITO] Límite actualizado a $LIMITE_DISCO%."
                        else
                            echo "    -> [ERROR] Debes ingresar un valor numérico válido."
                        fi
                        ;;
                    3)
                        echo "Regresando al menú principal..."
                        break # Rompe el bucle del submenú para volver al principal
                        ;;
                    *)
                        echo "    -> [ERROR] Opción no válida. Intenta de nuevo."
                        ;;
                esac
                echo "" 
            done
            ;;
            
        4)
            # ------------------------------------------------------------------
            # Módulo 4: Generación de Reporte
            # ------------------------------------------------------------------
            RUTA_REPORTE="./reporte_servidor.txt"
            echo "Recopilando datos para el reporte..."

            echo "==================================================" > "$RUTA_REPORTE"
            echo "           REPORTE DE RENDIMIENTO TI              " >> "$RUTA_REPORTE"
            echo "==================================================" >> "$RUTA_REPORTE"
            echo "Generado el : $(date)" >> "$RUTA_REPORTE"
            echo "Servidor    : $(hostname)" >> "$RUTA_REPORTE"
            echo "--------------------------------------------------" >> "$RUTA_REPORTE"
            
            echo "1. ESTADO DE LA MEMORIA RAM:" >> "$RUTA_REPORTE"
            free -h >> "$RUTA_REPORTE"
            echo "--------------------------------------------------" >> "$RUTA_REPORTE"
            
            echo "2. CARGA DEL SISTEMA (CPU):" >> "$RUTA_REPORTE"
            uptime | awk -F'load average:' '{print "Promedio de carga:" $2}' >> "$RUTA_REPORTE"
            echo "==================================================" >> "$RUTA_REPORTE"

            echo "¡Reporte generado exitosamente!"
            echo "Puedes revisar el resultado ejecutando: cat $RUTA_REPORTE"
            ;;
            
        5)
            echo "Saliendo del programa unificado. ¡Hasta pronto!"
            exit 0
            ;;
            
        *)
            echo "[ERROR] Opción no válida. Por favor, selecciona un número del 1 al 5."
            ;;
    esac
    echo "" # Espacio antes de iterar el menú principal de nuevo
done
