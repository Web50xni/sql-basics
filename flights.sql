-- Create flights table
CREATE TABLE flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origin TEXT NOT NULL,
    destination TEXT NOT NULL,
    duration INTEGER NOT NULL
);

-- Inserts
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('Shanghai', 'Paris', 760);
INSERT INTO flights (origin, destination, duration) VALUES ('Istanbul', 'Tokyo', 700);
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination, duration) VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination, duration) VALUES ('Lima', 'New York', 455);

-- Selects
SELECT * FROM flights; -- Muestra todos los vuelos en la tabla 'flights'
SELECT origin, destination FROM flights; -- Muestra solo los campos 'origin' y 'destination' de todos los vuelos
SELECT * FROM flights WHERE id = 3; -- Muestra el vuelo con id igual a 3
SELECT * FROM flights WHERE origin = 'New York'; -- Muestra los vuelos con origen en "New York"
SELECT * FROM flights WHERE duration > 500; -- Muestra los vuelos con duración mayor a 500 minutos
SELECT * FROM flights WHERE duration > 500 AND destination = 'Paris'; -- Muestra los vuelos con duración mayor a 500 minutos y destino "Paris"
SELECT * FROM flights WHERE duration > 500 OR destination = 'Paris'; -- Muestra los vuelos con duración mayor a 500 minutos o destino "Paris"
SELECT * FROM flights WHERE origin IN ('New York', 'Lima'); -- Muestra los vuelos con origen en "New York" o "Lima"
SELECT * FROM flights WHERE origin LIKE '%a%'; -- Muestra los vuelos cuyo origen contiene la letra "a"

-- Update
UPDATE flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London'; -- Actualiza la duración del vuelo de "New York" a "London" a 430 minutos

-- Delete
DELETE FROM flights WHERE destination = 'Tokyo'; -- Elimina los vuelos con destino "Tokyo"

-- Additional queries
-- Agregar una nueva columna a la tabla
ALTER TABLE flights ADD COLUMN status TEXT; -- Agrega una nueva columna llamada 'status' a la tabla 'flights'

-- Actualizar valores en función de una condición
UPDATE flights SET status = 'Delayed' WHERE duration > 600; -- Actualiza el 'status' de los vuelos con duración mayor a 600 minutos a 'Delayed'

-- Eliminar una columna de la tabla
-- ALTER TABLE flights DROP COLUMN status; -- Comentada para evitar eliminar la columna 'status' recién agregada.

-- Contar el número de registros en la tabla
SELECT COUNT(*) FROM flights; -- Cuenta el número total de vuelos en la tabla 'flights'

-- Calcular la duración promedio de los vuelos
SELECT AVG(duration) FROM flights; -- Calcula la duración promedio de todos los vuelos

-- Seleccionar los vuelos ordenados por duración de forma descendente
SELECT * FROM flights ORDER BY duration DESC; -- Muestra todos los vuelos ordenados por duración de forma descendente

-- Seleccionar los destinos únicos de los vuelos
SELECT DISTINCT destination FROM flights; -- Muestra todos los destinos únicos de los vuelos

-- Calcular la duración total de todos los vuelos
SELECT SUM(duration) FROM flights; -- Calcula la duración total de todos los vuelos

-- Seleccionar los vuelos que duran más que el promedio
SELECT * FROM flights WHERE duration > (SELECT AVG(duration) FROM flights); -- Muestra los vuelos con duración mayor que la duración promedio

-- Crear una tabla de pasajeros y vincularla a los vuelos
-- Sección de inserción de datos comentada debido a que requiere de una tabla de pasajeros y claves foráneas.
CREATE TABLE passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    flight_id INTEGER,
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);

INSERT INTO passengers (name, flight_id) VALUES ('Lía Cruz', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Elo Molina', 2);


-- Seleccionar el número de pasajeros en cada vuelo y 
--filtrar aquellos vuelos con más de un pasajero
-- SELECT f.id, COUNT(p.id) as passenger_count FROM flights f
-- LEFT JOIN passengers p ON f.id = p.flight_id
-- GROUP BY f.id
-- HAVING passenger_count > 1;
