-- Insertar clientes
INSERT INTO `OpticaCuloBotella`.`clientes` (`nombre`, `direccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigo_postal`, `pais`, `teléfono`, `email`, `fecha_registro`, `refererido`)
VALUES
('Juan Pérez', 'Avenida Siempre Viva', '123', 1, NULL, NULL, 'Springfield', '12345', 'USA', '555123456', 'juan.perez@example.com', '2023-01-10', NULL),
('Ana García', 'Calle Falsa', '456', 2, 1, 'B', 'Springfield', '54321', 'USA', '555234567', 'ana.garcia@example.com', '2023-02-15', 1),
('Carlos Sánchez', 'Boulevard del Sol', '789', 3, NULL, NULL, 'Shelbyville', '67890', 'USA', '555345678', 'carlos.sanchez@example.com', '2023-03-20', NULL),
('Laura Díaz', 'Calle Luna', '101', 4, 2, 'A', 'Springfield', '98765', 'USA', '555456789', 'laura.diaz@example.com', '2023-04-25', NULL),
('María López', 'Avenida Estrella', '202', 5, NULL, NULL, 'Shelbyville', '56789', 'USA', '555567890', 'maria.lopez@example.com', '2023-05-30', 3);

-- Insertar empleados
INSERT INTO `OpticaCuloBotella`.`empleados` (`nombre`, `apellidos`)
VALUES
('Pedro', 'Martínez'),
('Luisa', 'Fernández'),
('Marta', 'Gómez'),
('Raúl', 'Rodríguez'),
('Elena', 'García');

-- Insertar proveedores
INSERT INTO `OpticaCuloBotella`.`proveedores` (`nombre`, `telefono`, `fax`, `nif`, `direccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigo_postal`, `pais`)
VALUES
('Opticas Unidas', '555678901', '555789012', 'A12345678', 'Calle Cristal', '321', '1', NULL, NULL, 'Springfield', '45678', 'USA'),
('Lentes y Monturas S.A.', '555789012', NULL, 'B87654321', 'Avenida Espejo', '654', '2', 'C', '1', 'Shelbyville', '65432', 'USA'),
('Ojo Seguro', '555890123', '555901234', 'C23456789', 'Boulevard Gafas', '987', '3', NULL, NULL, 'Springfield', '78901', 'USA'),
('Visión Perfecta', '555901234', '555012345', 'D34567890', 'Calle Vista', '123', '4', NULL, NULL, 'Shelbyville', '32145', 'USA'),
('Mirada Clara', '555012345', NULL, 'E45678901', 'Avenida Ojo', '456', '5', '1', 'A', 'Springfield', '87654', 'USA');

-- Insertar marcas
INSERT INTO `OpticaCuloBotella`.`marcas` (`marca`, `id_proveedor`)
VALUES
('Ray-Ban', 1),
('Oakley', 2),
('Prada', 3),
('Gucci', 4),
('Armani', 5);

-- Insertar ventas
INSERT INTO `OpticaCuloBotella`.`ventas` (`id_empleado`, `fecha_transaccion`)
VALUES
(1, '2024-01-10 10:30:00'),
(1, '2024-02-15 11:00:00'),
(2, '2024-03-20 12:15:00'),
(3, '2024-04-25 13:45:00'),
(4, '2024-05-30 14:20:00');

-- Insertar gafas
INSERT INTO `OpticaCuloBotella`.`gafas` (`id_marca`, `grad_ojo_derecho`, `grad_ojo_izquierdo`, `montura`, `color_montura`, `color_lente_derecho`, `color_lente_izquierdo`, `precio`, `id_venta`, `id_cliente`)
VALUES
(1, -1.50, -1.75, 'pasta', 'negro', 'gris', 'gris', 120.00, 1, 1),
(2, -2.00, -2.25, 'metalica', 'plateado', 'azul', 'azul', 150.00, 2, 2),
(3, -3.00, -3.25, 'flotante', 'dorado', 'verde', 'verde', 200.00, 3, 3),
(4, -1.00, -1.25, 'pasta', 'rojo', 'marrón', 'marrón', 180.00, 4, 4),
(5, -0.50, -0.75, 'metalica', 'azul', 'negro', 'negro', 130.00, 5, 5),
(1, -1.50, -1.75, 'pasta', 'negro', 'gris', 'gris', 120.00, 1, 1),
(2, -2.50, -2.75, 'flotante', 'negro', 'verde', 'verde', 160.00, 2, 2),
(1, -2.00, -2.25, 'pasta', 'azul', 'gris', 'gris', 140.00, 3, 3);

