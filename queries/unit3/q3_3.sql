-- My question is: Which passengers have not booked any flight with a seat capacity of 300 or more?

-- Find passengers who booked a flight with at least 300 seats, and return all other passengers.


-- NOT IN 
SELECT p.*
FROM passengers p
WHERE p.passenger_id NOT IN (
    SELECT b.passenger_id
    FROM bookings b
             JOIN flights f
                  ON b.flight_id = f.flight_id
    WHERE f.seat_capacity >= 300
);
 
-- WITH clause
WITH large_flight_passengers AS (
    SELECT DISTINCT b.passenger_id
    FROM bookings b
             JOIN flights f
                  ON b.flight_id = f.flight_id
    WHERE f.seat_capacity >= 300
)
SELECT p.*
FROM passengers p
WHERE p.passenger_id NOT IN (
    SELECT passenger_id
    FROM large_flight_passengers
);

-- NOT EXISTS
SELECT p.*
FROM passengers p
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
             JOIN flights f
                  ON b.flight_id = f.flight_id
    WHERE b.passenger_id = p.passenger_id
      AND f.seat_capacity >= 300
);

-- 
-- Verify that all three query forms return identical result sets.
WITH
form1 AS (
    SELECT p.*
    FROM passengers p
    WHERE p.passenger_id NOT IN (
        SELECT b.passenger_id
        FROM bookings b
        JOIN flights f
          ON b.flight_id = f.flight_id
        WHERE f.seat_capacity >= 300
    )
),
large_flight_passengers AS (
    SELECT DISTINCT b.passenger_id
    FROM bookings b
    JOIN flights f
      ON b.flight_id = f.flight_id
    WHERE f.seat_capacity >= 300
),
form2 AS (
    SELECT p.*
    FROM passengers p
    WHERE p.passenger_id NOT IN (
        SELECT passenger_id
        FROM large_flight_passengers
    )
),
form3 AS (
    SELECT p.*
    FROM passengers p
    WHERE NOT EXISTS (
        SELECT 1
        FROM bookings b
        JOIN flights f
          ON b.flight_id = f.flight_id
        WHERE b.passenger_id = p.passenger_id
          AND f.seat_capacity >= 300
    )
)
SELECT 'Form 1 vs Form 2' AS comparison,
       COUNT(*) AS different_rows
FROM (
    (SELECT * FROM form1 EXCEPT SELECT * FROM form2)
    UNION ALL
    (SELECT * FROM form2 EXCEPT SELECT * FROM form1)
) differences

UNION ALL

SELECT 'Form 1 vs Form 3',
       COUNT(*)
FROM (
    (SELECT * FROM form1 EXCEPT SELECT * FROM form3)
    UNION ALL
    (SELECT * FROM form3 EXCEPT SELECT * FROM form1)
) differences;