-- Insertar datos en la tabla Usuarios
INSERT INTO Spotify.Usuarios (email, password, nombre_usuario, fecha_nacimiento, sexo, pais, codigo_postal, tipo_usuario)
VALUES 
('juan.perez@gmail.com', 'password123', 'Juan Perez', '1990-05-21', 'Masculino', 'México', '01000', 'premium'),
('maria.lopez@yahoo.com', 'password456', 'Maria Lopez', '1985-08-14', 'Femenino', 'España', '28001', 'free'),
('pedro.gomez@outlook.com', 'password789', 'Pedro Gomez', '2000-01-11', 'Masculino', 'Colombia', '110111', 'premium');

-- Insertar datos en la tabla Subscripciones
INSERT INTO Spotify.Subscripciones (email_usuario, fecha_inicio, fecha_renovacion, forma_pago)
VALUES 
('juan.perez@gmail.com', '2023-01-01', '2023-12-31', 'Tarjeta'),
('pedro.gomez@outlook.com', '2023-06-01', '2024-05-31', 'PayPal');

-- Insertar datos en la tabla Pagos
INSERT INTO Spotify.Pagos (id_subscripcion, fecha_pago, numero_orden, total)
VALUES 
(1, '2023-01-01', 'ORD12345', 99.99),
(2, '2023-06-01', 'ORD67890', 99.99);

-- Insertar datos en la tabla TarjetasCredito
INSERT INTO Spotify.TarjetasCredito (id_subscripcion, numero_tarjeta, mes_caducidad, ano_caducidad, codigo_seguridad)
VALUES 
(1, '4111111111111111', 12, 2024, 123);

-- Insertar datos en la tabla PayPal
INSERT INTO Spotify.PayPal (id_subscripcion, usuario_paypal)
VALUES 
(2, 'pedro.gomez@paypal.com');

-- Insertar datos en la tabla Playlists
INSERT INTO Spotify.Playlists (titulo, numero_canciones, fecha_creacion, estado, email_usuario)
VALUES 
('Mis Favoritas', 10, '2023-07-15', 'activa', 'juan.perez@gmail.com'),
('Workout Playlist', 15, '2022-09-20', 'activa', 'maria.lopez@yahoo.com');

-- Insertar datos en la tabla Artistas
INSERT INTO Spotify.Artistas (nombre)
VALUES 
('Coldplay'),
('The Beatles'),
('Shakira');

-- Insertar datos en la tabla Albumes
INSERT INTO Spotify.Albumes (titulo, ano_publicacion, portada_imagen, id_artista)
VALUES 
('A Head Full of Dreams', 2015, NULL, 1),
('Abbey Road', 1969, NULL, 2),
('El Dorado', 2017, NULL, 3);

-- Insertar datos en la tabla Canciones
INSERT INTO Spotify.Canciones (titulo, duracion, veces_reproducida, id_album)
VALUES 
('Adventure of a Lifetime', '00:04:23', 1000000, 1),
('Here Comes The Sun', '00:03:06', 500000, 2),
('Chantaje', '00:03:16', 700000, 3);

-- Insertar datos en la tabla canciones_playlist
INSERT INTO Spotify.canciones_playlist (id_playlist, id_cancion, email_usuario_que_agrego, fecha_agregado)
VALUES 
(1, 1, 'juan.perez@gmail.com', '2023-07-15'),
(2, 3, 'maria.lopez@yahoo.com', '2022-09-20');

-- Insertar datos en la tabla Artistas_Relacionados
INSERT INTO Spotify.Artistas_Relacionados (id_artista_relacionado, artistas_id_artista)
VALUES 
(2, 1), -- The Beatles relacionado con Coldplay
(3, 1); -- Shakira relacionada con Coldplay

-- Insertar datos en la tabla Favoritos
INSERT INTO Spotify.Favoritos (email_usuario, id_cancion, id_album)
VALUES 
('juan.perez@gmail.com', 1, 1),
('maria.lopez@yahoo.com', 3, 3);

