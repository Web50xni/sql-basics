SELECT f.id, f.origin, f.destination, p.name
FROM flights f
FULL OUTER JOIN passengers p ON f.id = p.flight_id;
