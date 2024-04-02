-- Seleccionar el número de pasajeros en cada vuelo y 
--filtrar aquellos vuelos con más de un pasajero
SELECT f.id, COUNT(p.id) as passenger_count FROM flights f
LEFT JOIN passengers p ON f.id = p.flight_id
GROUP BY f.id
HAVING passenger_count > 1;
