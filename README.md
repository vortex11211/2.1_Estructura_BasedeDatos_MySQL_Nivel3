# **2.1-Estructura de Base de Datos-Nivel3**
El ejercicio nos proporciona diferentes enunciados dependiendo del nivel para crear la estructura de una base de datos utilizando MySQL.
Para la entrega se solicita un modelo relacinal en formato imagen, así como los scripts de creación  y carga de la base de datos.
## **Nivel 1**
 ⭐
-**Ejercicio 1 - Óptica**

La óptica “Cul d’Ampolla” quiere informatizar la gestión de clientes y ventas de gafas. Para ello se crea una base de datos con las relaciones solicitadas entre Clientes, Proveedores, Gafas, Ventas y Empleados.
![Diagrama Optica](editar)

-**Ejercicio 2 - Pizzería**
Crear la base de datos para una Pizzeria que tenga las relaciones solicitadas  entre Clientes, Pedidos, empleados, productos, repartos y tiendas.
![Diagrama Pizzeria](editar)

Para este nivel, nos piden una serie de requisitos para su entrega:


**Óptica:**

-Lista el total de compras de un cliente/a.

-Lista las distintas gafas que ha vendido un empleado durante un año.

-Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.

**Pizzería:**

-Lista cuántos productos de tipo “Bebidas”. se han vendido en una determinada localidad.

-Lista cuántos pedidos ha efectuado un determinado empleado/a.
 **_Para realizar las consultas que nos indica el ejercicio cargaremos las bases de datos de manera local en MySQL WorkBench y procederemos a trabajar con ellas según se nos indica._**
 
## **Nivel 2**
⭐⭐

Crear la base de datos para una version compacta de YouTube en que cumpla con las relaciones entre usuarios,suscripciones, canales, videos, listas de reproduccion, etiquetas, comentarios y reacciones según indica el enunciado.

![Diagrama YouTube](editar)

Creación de un script de carga con datos de prueba para verificar el funcionamiento.

## **Nivel 3**
 ⭐⭐⭐
Crear la estructura de la base de datos que muestre una versión compacta de Spotify, cumpliendo con las relaciones que pide el enunciado entre: Usuarios, suscripciones, pagos, métodos de pago (paypal, tarjeta de crédito), playlists, artistas, albunes, canciones, artistas relacinados y favoritos.

![Diagrama Spotify](editar)

Creación de un script de carga con datos de prueba para verificar el funcionamiento


## **Requisitos:**
[MySQL](https://dev.mysql.com/downloads/mysql/ "MySQL")

[MySQL Workbench](https://dev.mysql.com/downloads/workbench/ "MySQL Workbench")


Para su instalación puedes seguir este [Video Tutorial](https://www.youtube.com/watch?v=EmQZt6o6-78 "Tutorial")


**Clona o descarga el Repositorio**
Para comprobar las consultas clona o descarga el repositorio para trabajar de manera local.

bases de datos de la tienda `schema_tienda.sql`

consultas asociadas a la tienda `queries_tienda.sql`

bases de datos de la universidad `schema_universidad.sql`

Consultas asociadas a la universidad `queries_universidad.sql`


## Instrucciones para ejecutar los scripts en MySQL Workbench

1. **Crear la base de datos `create_schema_example.sql`**:
    - En MySQL Workbench, ve a `File` > `Open SQL Script`.
    - Selecciona el archivo `create_schema_example.sql`.
    - Haz clic en el botón de ejecutar (⚡) para crear la base de datos.

2. **Rellenar con los datos de prueba  `fill_example.sql`**:
    - Abre el archivo `fill_example.sql` de la misma manera.
    - Haz clic en el botón de ejecutar (⚡)  para cargar los datos.
    
En el caso de que el ejercicio tenga consultas:
3. **Realiza las consultas `queries_example.sql`**
- Abre el archivo `queries_example.sql`  de la base de datos que corresponda y ejecutalo de manera similar para visualizarlas.
