-- Crear índice en la columna flight_id de la tabla passengers
CREATE INDEX idx_passengers_flight_id ON passengers(flight_id);

-- Consulta utilizando el índice en la tabla passengers pero seleccionando desde flights
SELECT f.id, f.origin, f.destination, p.name
FROM flights f
INNER JOIN passengers p ON f.id = p.flight_id;
