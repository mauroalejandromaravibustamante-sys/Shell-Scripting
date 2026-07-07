#!/bin/bash
# 3_estructuras_control.sh - Menú interactivo para verificar el almacenamiento

# Límite por defecto
LIMITE_DISCO=80

# Bucle infinito para mantener el menú abierto hasta elegir "Salir"
while true; do
    echo "=================================================="
    echo "       MENÚ DE MONITOREO DE ALMACENAMIENTO        "
    echo "=================================================="
    echo "1) Verificar uso del disco raíz (/)"
    echo "2) Configurar límite de alerta (Actual: $LIMITE_DISCO%)"
    echo "3) Salir"
    echo "=================================================="

    # Leer la opción del usuario
    read -p "Selecciona una opción [1-3]: " OPCION
    echo "--------------------------------------------------"

    # Evaluar la opción ingresada
    case $OPCION in
        1)
            echo "[*] Verificando estado del almacenamiento en '/'..."
            # Obtener el porcentaje eliminando el símbolo '%'
            USO_DISCO=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

            if [ "$USO_DISCO" -ge "$LIMITE_DISCO" ]; then
                echo "    -> [ADVERTENCIA] Uso crítico del disco: $USO_DISCO%."
                echo "    -> Acción requerida: Liberar espacio."
            else
                echo "    -> [OK] El uso del disco es del $USO_DISCO%. (Normal)."
            fi
            ;;
        2)
            # Cambiar la variable del límite temporalmente
            read -p "Ingresa el nuevo porcentaje límite (ej. 90): " NUEVO_LIMITE

            # Validar que el usuario haya ingresado un número
            if [[ "$NUEVO_LIMITE" =~ ^[0-9]+$ ]]; then
                LIMITE_DISCO=$NUEVO_LIMITE
                echo "    -> [ÉXITO] Límite actualizado a $LIMITE_DISCO%."
            else
                echo "    -> [ERROR] Debes ingresar un valor numérico válido."
            fi
            ;;
        3)
            echo "Saliendo del módulo de monitoreo de disco..."
            break # Rompe el bucle while y termina el script
            ;;
        *)
            # Si el usuario ingresa cualquier otra cosa
            echo "    -> [ERROR] Opción no válida. Intenta de nuevo."
            ;;
    esac
    echo "" # Espacio en blanco para mayor legibilidad antes de repetir el menú
done
