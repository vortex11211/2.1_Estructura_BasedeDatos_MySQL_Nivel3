-- Script para rellena Pizzeria
-- Insertar Clientes
INSERT INTO `pizzeria`.`clientes` (`nombre`,`apellido`,`calle`, `numero`,`piso`, `puerta`, `codigo_postal`,`localidad`, `provincia`, `telefono`)
VALUES
('Juanito','Perez','falsa','123',null,null,'08917','Badalona','Barcelona','610000000'),
('Luisito','Comunica','real','321','2do','A','08917','Badalona','Barcelona','617000000'),
('Dulceida','Chafa','av Marques','12','2do','5','08946','Badalona','Barcelona','655000000'),
('Marta','López','Balmes','67','4to','1','08003','Barcelona','Barcelona','655000003'),
('Carlos','Martínez','Diagonal','89','2do','3','08004','Mataro','Barcelona','655000004'),
('Laura','Sánchez','Rambla','12','1ro','5','08005','Barcelona','Barcelona','65500000'),
('Jorge','Fernández','Muntaner','34','3ro','2','08006','Mataro','Barcelona','655000006'),
('Elena','Ruiz','Casanova','56','4to','1','08007','Barcelona','Barcelona','655000007');

-- Insertar Tiendas
INSERT INTO `Pizzeria`.`tienda` (`calle`, `numero`, `local`, `codigo_postal`, `localidad`, `provincia`)
VALUES
('Calle A', '10', '1', '28001', 'Badalona', 'Barcelona'),
('Calle B', '22', '3', '28002', 'Barcelona', 'Barcelona'),
('Calle C', '15', '2', '28003', 'Mataro', 'Barcelona');

-- Insertar Empleados
INSERT INTO `Pizzeria`.`Empleados` (`id_tienda`, `nombre`, `apellidos`, `nif`, `telefono`, `puesto`)
VALUES
(1, 'Juan', 'Pérez', '12345678A', '600000001', 'cocinero'),
(1, 'María', 'González', '12345678B', '600000002', 'repartidor'),
(1, 'Carlos', 'López', '12345678C', '600000003', 'repartidor'),
(2, 'Ana', 'Martínez', '12345678D', '600000004', 'cocinero'),
(2, 'Luis', 'Sánchez', '12345678E', '600000005', 'repartidor'),
(2, 'Elena', 'Ramírez', '12345678F', '600000006', 'repartidor'),
(3, 'José', 'Fernández', '12345678G', '600000007', 'cocinero'),
(3, 'Laura', 'Díaz', '12345678H', '600000008', 'repartidor'),
(3, 'David', 'Gómez', '12345678I', '600000009', 'repartidor');

-- Insertar categorías
INSERT INTO `Pizzeria`.`categorias` (`nombre_categoria`)
VALUES
('Clásicas'),
('Especiales'),
('Vegetarianas');

-- Insertar Productos
INSERT INTO `Pizzeria`.`productos` (`nombre_producto`, `descripcion`, `precio`, `tipo`, `imagen`, `id_categoria`)
VALUES
('Pizza Margarita', 'Pizza clásica con tomate, mozzarella y albahaca.', 8.99, 'pizza', NULL, 1),
('Pizza Pepperoni', 'Pizza con pepperoni, mozzarella y salsa de tomate.', 9.99, 'pizza', NULL, 1),
('Pizza Cuatro Quesos', 'Pizza con una mezcla de cuatro quesos: mozzarella, cheddar, roquefort y parmesano.', 10.99, 'pizza', NULL, 1),
('Pizza BBQ', 'Pizza con pollo, bacon, cebolla y salsa BBQ.', 11.99, 'pizza', NULL, 2),
('Pizza Hawaiana', 'Pizza con jamón, piña y mozzarella.', 9.99, 'pizza', NULL, 2),
('Pizza Vegetariana', 'Pizza con tomate, mozzarella, pimientos, champiñones y aceitunas.', 10.99, 'pizza', NULL, 3),
('Pizza Vegana', 'Pizza sin productos de origen animal, con queso vegano, verduras y tofu.', 11.99, 'pizza', NULL, 3),
('Hamburguesa Clásica', 'Hamburguesa con carne de res, lechuga, tomate y queso.', 7.99, 'hamburguesa', NULL, NULL),
('Hamburguesa BBQ', 'Hamburguesa con carne de res, bacon, queso cheddar y salsa BBQ.', 8.99, 'hamburguesa', NULL, NULL),
('Coca-Cola', 'Bebida gaseosa.', 1.99, 'bebida', NULL, NULL),
('Fanta Naranja', 'Bebida gaseosa sabor naranja.', 1.99, 'bebida', NULL, NULL),
('Agua Mineral', 'Botella de agua mineral.', 1.50, 'bebida', NULL, NULL);

-- Insertar pedidos
INSERT INTO `Pizzeria`.`pedidos` (`id_cliente`, `id_tienda`, `fecha`, `entrega`, `precio`)
VALUES
(1, 1, '2024-08-01 12:00:00', 'domicilio', 19.98),
(2, 1, '2024-08-01 13:00:00', 'domicilio', 11.99),
(3, 2, '2024-08-01 14:00:00', 'domicilio', 23.98),
(4, 2, '2024-08-02 12:00:00', 'domicilio', 19.98),
(5, 2, '2024-08-02 13:00:00', 'domicilio', 9.99),
(6, 3, '2024-08-02 14:00:00', 'domicilio', 22.98),
(7, 3, '2024-08-03 12:00:00', 'domicilio', 17.98),
(8, 3, '2024-08-03 13:00:00', 'local', 8.99),
(2, 1, '2024-08-03 14:00:00', 'local', 18.98);

-- Insertar Repartos
INSERT INTO `Pizzeria`.`repartos` (`id_pedido`, `id_empleado`, `fecha_entrega`)
VALUES
(1, 2, '2024-08-01 12:30:00'),
(2, 3, '2024-08-01 13:30:00'),
(3, 5, '2024-08-01 14:30:00'),
(4, 6, '2024-08-02 12:30:00'),
(5, 6, '2024-08-02 13:30:00'),
(6, 8, '2024-08-02 14:30:00'),
(7, 9, '2024-08-03 12:30:00');

-- Insertar pedidos
INSERT INTO `pizzeria`.`detalle_pedido` (`id_pedido`, `id_producto`, `cantidad`)
VALUES
(1, 1, 2),
(2, 4, 1),
(3, 5, 2),
(4, 2, 2),
(5, 6, 1),
(6, 7, 2),
(7, 3, 2),
(8, 8, 1),
(9, 10, 1),
(9, 9, 1);