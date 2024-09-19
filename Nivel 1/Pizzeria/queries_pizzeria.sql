-- Muestra el total de bebidas vendidas en una localidad

SELECT SUM(dp.cantidad) AS total_bebidas_vendidas_Badalona
FROM detalle_pedido dp
JOIN pedidos p ON dp.id_pedido = p.id_pedido
JOIN productos pr ON dp.id_producto = pr.id_producto
JOIN tienda t ON p.id_tienda = t.id_tienda
WHERE pr.tipo = 'bebida'
AND t.localidad = 'Badalona';

-- Nos devuelve el total de pedidos de la empleada Elena
SELECT p.id_pedido, p.fecha, p.entrega, p.precio, r.fecha_entrega
FROM pedidos p
JOIN repartos r ON p.id_pedido = r.id_pedido
JOIN Empleados e ON r.id_empleado = e.id_empleado
WHERE e.nombre = 'Elena';