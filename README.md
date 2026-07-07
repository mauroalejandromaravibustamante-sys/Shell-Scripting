# Evaluación Parcial: Shell Scripting 

Este repositorio contiene la evaluación parcial del curso de *Shell Scripting*, perteneciente a la carrera de *Administración en Ciberseguridad* del *Instituto Superior Tecnológico IDAT*. 

El proyecto consta de una serie de scripts en Bash (Linux) diseñados para automatizar tareas comunes de administración de sistemas, monitoreo y generación de reportes.

---

##  Datos del Proyecto

* **Institución:** Instituto Superior Tecnológico IDAT
* **Carrera:** Administración en Ciberseguridad
* **Profesor:** Gonzales Guevara Rommel Andrés
* **Alumnos:**  Patiño Gómez, Roland  ; 
                Maravi Bustamante, Mauro

---

##  Descripción:

A continuación detallamos la funcionalidad de cada uno de los scripts

### 1. Información Básica del Sistema (`1_info_sistema.sh`)
Este script almacena datos claves del hardware y del entorno en variables locales y luego las despliega formateadas en la terminal. 
* **Datos mostrados:** Usuario actual, versión del Kernel, arquitectura del sistema, fecha/hora y tiempo de encendido (`uptime`).
  
<img width="886" height="250" alt="image" src="https://github.com/user-attachments/assets/e6cb3eba-b09c-40ae-8e6a-2db68bac6279" />

### 2. Limpieza Automatizada de Temporales (`2_limpieza_temporal.sh`)
Este script automatiza la eliminación de archivos de un directorio específico. 
* **Características:** Si el directorio objetivo (ej. `/tmp/cache_ti`) no existe, lo crea y genera archivos de prueba ficticios (`.tmp`) para demostrar su funcionamiento antes de proceder con la limpieza segura.
<img width="886" height="175" alt="image" src="https://github.com/user-attachments/assets/39064ffb-5be4-4c3f-9e97-131adb4eda00" />
  
### 3. Estructuras de Control (`3_estructuras_control.sh`)
Proporciona un menú interactivo que evalúa escenarios críticos mediante el uso de condiciones (`if`), operadores lógicos y bucles (`while`).
* **Funciones del menú:** Permite verificar el uso del disco raíz (`/`), configurar un límite de alerta personalizado para el almacenamiento y simular reintentos de conexión.
<img width="886" height="953" alt="image" src="https://github.com/user-attachments/assets/3f847b30-b321-4d1e-8a6f-926982925543" />

### 4. Generación de Reporte TI (`4_generar_reporte.sh`)
Este script recolecta datos críticos de rendimiento del servidor y utiliza redirecciones de salida (`>` y `>>`) para escribir directamente en un archivo estructurado.
* **Contenido del reporte:** Genera un documento en texto plano (`reporte_servidor.txt`) que sirve como reporte para el área de TI, incluyendo el estado de la Memoria RAM y el promedio de carga del procesador (CPU).
<img width="886" height="438" alt="image" src="https://github.com/user-attachments/assets/48635107-22eb-45d0-8602-590e7fdf6218" />

### 5. Resultado final mediante un Menu automatizado (`menu_utilidades.sh`)

<img width="943" height="216" alt="image" src="https://github.com/user-attachments/assets/840c04e5-8ac8-4ed4-9799-7dcc3106a037" />



---

