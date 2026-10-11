-- Part A
-- Reproduce: I want to count the number of flights that do not originate from Thailand. However, 
-- I notice that the count seems to be lower than expected. I suspect that NULL values in the origin_country column are being excluded from the count.
-- I created a temp table to add a null value to the origin_country column 
 
CREATE TEMP TABLE flights_bug_demo AS
SELECT *
FROM flights;
ALTER TABLE flights_bug_demo
    ALTER COLUMN origin_country DROP NOT NULL;

INSERT INTO flights_bug_demo (
    flight_id,
    flight_number,
    first_scheduled_on,
    origin_country,
    tail_number,
    seat_capacity,
    is_active
)
VALUES (
           '16',
        'VA0000',
           '2022-10-10',
           NULL,
           'VA0000',
           200,
           TRUE
       );

-- Original query: NULL rows are silently excluded
SELECT COUNT(*) AS returned_count
FROM flights_bug_demo
WHERE origin_country != 'Thailand'; -- Result: 11
SELECT COUNT(*) AS omitted_count
FROM flights_bug_demo
WHERE origin_country IS NULL; -- Result: 1
SELECT COUNT(*) AS total_count
FROM flights_bug_demo;
SELECT COUNT(*) AS corrected_count -- Result: 16
FROM flights_bug_demo
WHERE origin_country != 'Thailand'
   OR origin_country IS NULL; -- Result: 12


-- Part B
-- Reproduce the alias error
SELECT
    seat_capacity * 2 AS total_seats
FROM flights
WHERE total_seats > 500;

-- FIX 
SELECT
    seat_capacity * 2 AS total_seats
FROM flights
WHERE seat_capacity * 2 > 500;

WITH flight_capacity AS (
    SELECT
        flight_id,
        flight_number,
        seat_capacity * 2 AS total_seats
    FROM flights
)
SELECT *
FROM flight_capacity
WHERE total_seats > 500;