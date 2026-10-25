-- Task 4.1 Q1: Overall booking and fare statistics
SELECT
    COUNT(*) AS booking_count,
    SUM(fare_paid) AS total_fare_paid,
    AVG(fare_paid) AS average_fare_paid,
    MIN(fare_paid) AS minimum_fare_paid,
    MAX(fare_paid) AS maximum_fare_paid,
    COUNT(DISTINCT passenger_id) AS distinct_passengers
FROM bookings;

-- Q2: Booking count and average fare for each flight
SELECT
    f.flight_id,
    COUNT(b.booking_id) AS booking_count,
    AVG(b.fare_paid) AS average_fare_paid
FROM flights AS f
LEFT JOIN bookings AS b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id
ORDER BY booking_count DESC, f.flight_id;

-- Q3: Flights with at least 10 bookings
SELECT
    f.flight_id,
    COUNT(b.booking_id) AS booking_count,
    AVG(b.fare_paid) AS average_fare_paid
FROM flights AS f
JOIN bookings AS b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id
HAVING COUNT(b.booking_id) >= 10
ORDER BY booking_count DESC, f.flight_id;


-- Q4: Booking statistics by flight and origin country
SELECT
    f.origin_country,
    f.flight_id,
    COUNT(b.booking_id) AS booking_count,
    SUM(b.fare_paid) AS total_fare_paid,
    AVG(b.fare_paid) AS average_fare_paid,
    COUNT(DISTINCT b.passenger_id) AS distinct_passengers
FROM flights AS f
JOIN bookings AS b
    ON f.flight_id = b.flight_id
GROUP BY
    f.origin_country,
    f.flight_id
ORDER BY
    f.origin_country,
    booking_count DESC,
    f.flight_id;