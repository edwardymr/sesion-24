-- create a table
CREATE TABLE restaurantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(100) NOT NULL
);
CREATE TABLE comidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  restaurante_ID INT,
  FOREIGN KEY (restaurante_ID) REFERENCES restaurantes(ID) ON DELETE CASCADE
);
INSERT INTO restaurantes (nombre, ubicacion)
VALUES
('La Cocina Italiana', 'Centro'),
('Sabor Tropical', 'Norte'),
('Delicias del Mar', 'Sur');
INSERT INTO comidas (nombre, tipo, precio, restaurante_ID)
VALUES
('Pizza Margarita', 'Italiana',20.50,1),
('Lasaña de Carne', 'Italiana', 25.00, 1),
('Arepa de Queso', 'Colombiana', 5.00, 2),
('Cazuela de Mariscos', 'Mariscos', 30.00, 3),
('Sancocho de Pescado', 'Mariscos', 18.00, 3);

SELECT * FROM restaurantes;
SELECT * FROM comidas;

SELECT nombre,tipo,precio
FROM comidas
WHERE precio > 20.00;

SELECT comidas.nombre, comidas.tipo, comidas.precio
FROM comidas
JOIN restaurantes ON comidas.restaurante_ID = restaurantes.ID
WHERE restaurantes.nombre = 'Delicias del Mar';

SELECT restaurantes.nombre, COUNT(comidas.ID) AS cantidad_comidas
FROM comidas
JOIN restaurantes ON comidas.restaurante_ID = restaurantes.ID
GROUP BY restaurantes.nombre
HAVING cantidad_comidas > 1;

UPDATE comidas
SET tipo = 'Fusion'
WHERE nombre = 'Pizza Margarita';

SELECT * FROM comidas;

DELETE FROM restaurantes
WHERE nombre = 'Sabor Tropical';

SELECT * FROM restaurantes;
SELECT * FROM comidas;