SELECT city, COUNT(reservations.id) AS total_reservations
FROM reservations
JOIN properties ON properties.id = reservations.property_id
GROUP BY city
ORDER BY COUNT(reservations.id) DESC;