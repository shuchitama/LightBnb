SELECT properties.*, reservations.*, AVG(property_reviews.rating) AS average_rating
FROM properties
JOIN reservations ON reservations.property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE reservations.guest_id = 1
GROUP BY properties.id, reservations.id 
HAVING end_date < now()::date
ORDER BY start_date DESC
LIMIT 10;