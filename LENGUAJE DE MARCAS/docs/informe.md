# Informe Técnico: Gestión de Datos - IT Alex Academy

Este informe detalla la implementación del sistema de intercambio y visualización de datos de la academia mediante tecnologías XML.

## 1. Datos representados en el XML
El archivo `reservas.xml` actúa como un **vínculo entre la base de datos y el usuario final**. Representa la programación de cursos y la ocupación de las instalaciones. Los datos principales incluyen:

* **Infraestructura:** Listado de aulas (físicas o virtuales) con su capacidad e identificador único.
* **Personal:** Profesores de la academia, su especialidad y su ID de referencia.
* **Operativa (Reservas):** Es el núcleo del documento. Cruza los datos de profesores y aulas para mostrar qué curso se imparte, en qué horario, en qué aula, quién lo da y cuál es su estado actual (Confirmada/Pendiente).

## 2. Validación con el DTD
Para garantizar que los datos exportados no contienen errores (como aulas inexistentes o tipos de datos incorrectos), se utiliza el archivo `modelo.dtd`.

### Pasos para la validación:
**Vínculo en el XML:** Se ha incluido la declaración `<!DOCTYPE academia SYSTEM "modelo.dtd">` en la cabecera del XML.

**Validación mediante IDE:** Validadores online como `xmlvalidation.com`, basta con subir ambos archivos. El sistema confirmará si la estructura cumple las reglas de cardinalidad y tipos definidas.

## 3. Transformación XSLT y Visualización HTML
El archivo `transform.xsl` convierte los datos técnicos del XML en un reporte visual legible para cualquier empleado de la academia.

## 4. Evidencia de funcionamiento
Las evidencias del correcto funcionamiento se encuentran en la carpeta `/capturas`:
* `validacion_dtd.png` y `validacion_dtd2.png`: Muestra el log de validación correcta del DTD.
* `error_dtd.png`: Demuestra cómo el DTD detecta un error si cambiamos un ID o un tipo de aula.
* `transform_html.png`: Captura de pantalla de la tabla final renderizada con CSS.

## 5. Integración en el Proyecto IT Alex Academy
Este módulo no es un archivo aislado, sino una pieza clave del flujo de información:

•	**Exportación de datos:** La base de datos genera periódicamente un archivo reservas.xml donde se ve el estado actual de las aulas y profesores
•	**Validación de estructura:** Antes de publicarse el archivo se valida con un modelo.dtd para asegurar que no hay errores como aulas o profesores inexistentes.
•	**Generación de Reporte XSLT:** El sistema aplica el transform.xsl para convertir los datos en un reporte interactivo HTML, y este reporte es el que consultan los profesores para conocer sus horarios.
•	**Se proporciona un archivo reservas.JSON** con la misma estructura para permitir que futuras apps móviles puedan consumir la información de forma ligera y rápida.
