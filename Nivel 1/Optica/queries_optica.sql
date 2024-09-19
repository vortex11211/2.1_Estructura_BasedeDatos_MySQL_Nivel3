-- Listar las compras totales de un cliente (cantidad de gafas)
SELECT c.nombre AS nombre_cliente, COUNT(g.id_gafa) AS cantidad_gafas
FROM OpticaCuloBotella.clientes c
JOIN OpticaCuloBotella.gafas g ON c.cliente_id = g.id_cliente
WHERE c.nombre = 'Ana García';

-- listar las diferentes Gafas que ha vendido un empleado durante un año
SELECT e.nombre AS nombre_empleado, g.id_gafa, g.grad_ojo_derecho, g.grad_ojo_izquierdo, g.montura, g.color_montura, g.color_lente_derecho, g.color_lente_izquierdo, g.precio, v.fecha_transaccion
FROM OpticaCuloBotella.empleados e
JOIN OpticaCuloBotella.ventas v ON e.id_empleado = v.id_empleado
JOIN OpticaCuloBotella.gafas g ON v.id_venta = g.id_venta
WHERE YEAR(v.fecha_transaccion) = 2024
AND e.nombre = 'Pedro'
ORDER BY v.fecha_transaccion;

-- listar  los proveedores que han suministrado con éxito gafas vendidas para la óptica.

SELECT p.nombre AS nombre_proveedor, COUNT(g.id_gafa) AS gafas_vendidas
FROM OpticaCuloBotella.proveedores p
JOIN OpticaCuloBotella.marcas m ON p.id_proveedor = m.id_proveedor
JOIN OpticaCuloBotella.gafas g ON m.id_marca = g.id_marca
JOIN OpticaCuloBotella.ventas v ON g.id_venta = v.id_venta
GROUP BY p.nombre;
