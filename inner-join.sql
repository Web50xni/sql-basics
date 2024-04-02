-- INNER JOIN: Devuelve solo los registros que tienen coincidencias en ambas tablas.
SELECT f.id, f.origin, f.destination, p.name
FROM flights f
INNER JOIN passengers p ON f.id = p.flight_id;
