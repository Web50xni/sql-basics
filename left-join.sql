--LEFT JOIN: Devuelve todos los registros de la tabla izquierda (flights) y 
--los registros coincidentes de la tabla derecha (passengers). 
--Si no hay coincidencias, se devuelve NULL para las columnas de la tabla derecha.
SELECT f.id, f.origin, f.destination, p.name
FROM flights f
LEFT JOIN passengers p ON f.id = p.flight_id ORDER;
