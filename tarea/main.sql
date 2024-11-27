CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(100) NOT NULL
);
CREATE TABLE libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  genero VARCHAR(50) NOT NULL,
  ano_publicacion YEAR NOT NULL,
  autor_ID INT,
  FOREIGN KEY (autor_ID) REFERENCES autores(ID) ON DELETE CASCADE
);
INSERT INTO autores (nombre, nacionalidad)
VALUES
('Dominique Lapierre', 'Frances'),
('Jostein Gaarder', 'Noruego'),
('James Redfield', 'Estadounidense');
INSERT INTO libros (titulo, genero, ano_publicacion, autor_ID)
VALUES
('Mas grandes que el amor', 'Drama',1990,1),
('¿Arde New York?', 'Novela', 2004, 1),
('El mundo de Sofía', 'Novela', 1991, 2),
('Somos nosotros los que estamos aquí ahora', 'Filosofia', 2022, 2),
('Las Nueve Revelaciones', 'Novela', 1993, 3);

SELECT libros.titulo
FROM libros
JOIN autores ON libros.autor_ID = autores.ID
WHERE autores.nombre = 'Dominique Lapierre';

SELECT titulo, genero, ano_publicacion
FROM libros
WHERE ano_publicacion > 2000;

SELECT autores.nombre, COUNT(libros.ID) AS cantidad_libros
FROM libros
JOIN autores ON libros.autor_ID = autores.ID
GROUP BY autores.nombre
HAVING cantidad_libros > 1;

UPDATE libros
SET genero = 'Tecnico'
WHERE titulo = 'El mundo de Sofía';

SELECT * FROM libros;
SELECT * FROM autores;

DELETE FROM autores
WHERE nombre = 'Dominique Lapierre';

SELECT * FROM libros;
SELECT * FROM autores;