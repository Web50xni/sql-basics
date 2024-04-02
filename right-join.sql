-- RIGHT JOIN: Devuelve todos los registros de la tabla derecha 
-- (passengers) y los registros coincidentes de la tabla izquierda (flights). 
-- Si no hay coincidencias, se devuelve NULL para las columnas de la tabla izquierda.

SELECT f.id, f.origin, f.destination, p.name
FROM flights f
RIGHT JOIN passengers p ON f.id = p.flight_id;
