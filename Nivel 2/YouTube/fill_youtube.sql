-- Inserciones en la tabla 'usuarios'
INSERT INTO `miniYoutube`.`usuarios` (email, password, nombre_usuario, fecha_nacimiento, sexo, pais, codigopostal)
VALUES 
('usuario1@gmail.com', 'pass123', 'usuario1', '1990-01-15', 'masculino', 'Mexico', '12345'),
('usuario2@gmail.com', 'pass456', 'usuario2', '1985-07-22', 'femenino', 'Argentina', '54321');

-- Inserciones en la tabla 'canales'
INSERT INTO `miniYoutube`.`canales` (nombrecanal, descripcion, fecha_creacion, usuarios_id_usuarios)
VALUES 
('Canal Tech', 'Canal sobre tecnología y gadgets', '2023-05-01', 1),
('Canal Vlogs', 'Vlogs de viajes por el mundo', '2023-06-10', 2);

-- Inserciones en la tabla 'videos_playlist'
INSERT INTO `miniYoutube`.`videos_playlist` (id_playlist, id_video)
VALUES 
(1, 1), (1, 2);

-- Inserciones en la tabla 'playlist'
INSERT INTO `miniYoutube`.`playlist` (nombre_playlist, fecha_creacion, estado, videos_playlist_id_video, videos_playlist_id_playlist, usuarios_id_usuarios)
VALUES 
('Playlist Tecnología', '2023-08-01', 'publica', 1, 1, 1),
('Playlist Vlogs', '2023-08-15', 'privada', 2, 1, 2);

-- Inserciones en la tabla 'videos'
INSERT INTO `miniYoutube`.`videos` (titulo, descripcion, tamaño, nombre_archivo, duracion, miniatura, numero_reproducciones, numero_likes, numero_dislikes, estado, usuarioquepublica, fechapublicacion, canales_idcanal, videos_playlist_id_video, videos_playlist_id_playlist)
VALUES 
('Review iPhone 14', 'Unboxing y review del iPhone 14', 500, 'iphone14.mp4', '00:10:30', NULL, 1000, 150, 10, 'publico', 'usuario1', '2023-08-10 12:00:00', 1, 1, 1),
('Vlog en Japón', 'Recorriendo Japón en 10 días', 700, 'japan_vlog.mp4', '00:15:45', NULL, 2000, 300, 20, 'publico', 'usuario2', '2023-08-12 15:30:00', 2, 2, 1);

-- Inserciones en la tabla 'etiquetas'
INSERT INTO `miniYoutube`.`etiquetas` (nombre_etiqueta)
VALUES 
('tecnologia'), 
('viajes');

-- Inserciones en la tabla 'etiquetas_video'
INSERT INTO `miniYoutube`.`etiquetas_video` (id_video, id_etiquetas, videos_publicados_id_video, etiquetas_id_etiquetas)
VALUES 
(1, 1, 1, 1), 
(2, 2, 2, 2);

-- Inserciones en la tabla 'suscripciones'
INSERT INTO `miniYoutube`.`suscripciones` (idcanal, fecha_suscripcion, usuarios_id_usuarios)
VALUES 
(1, '2023-08-05 14:30:00', 2), 
(2, '2023-08-10 09:00:00', 1);

-- Inserciones en la tabla 'videos_like_dislike'
INSERT INTO `miniYoutube`.`videos_like_dislike` (id_video, id_usuario, tipo_like_dislike, fechayhora, videos_id_video)
VALUES 
(1, 2, 'like', '2023-08-10 13:00:00', 1), 
(2, 1, 'dislike', '2023-08-12 16:00:00', 2);

-- Inserciones en la tabla 'Comentarios'
INSERT INTO `miniYoutube`.`Comentarios` (texto, fecha_hora, videos_publicados_id_video, usuarios_id_usuarios)
VALUES 
('Muy buen video, gracias por la información', '2023-08-10 14:00:00', 1, 2), 
('Increíble viaje, quiero visitar Japón', '2023-08-12 17:00:00', 2, 1);

-- Inserciones en la tabla 'likes_dislikes_comentarios'
INSERT INTO `miniYoutube`.`likes_dislikes_comentarios` (id_comentario, tipolike, fecha, Comentarios_id_comentario, id_usuario)
VALUES 
(1, 'like', '2023-08-10 15:00:00', 1, 1), 
(2, 'dislike', '2023-08-12 18:00:00', 2, 2);
