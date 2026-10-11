-- 3.1.1: Find active flights with at least 180 seats.
SELECT *
FROM flights
WHERE is_active = TRUE
  AND seat_capacity >= 180
ORDER BY seat_capacity DESC
LIMIT 10;
-- The query returned 8 flights. All are active and have at least 180 seats. The results are sorted from the highest to the lowest seat capacity.


-- 3.1.2: Find all distinct active-status values.
SELECT DISTINCT is_active
FROM flights
ORDER BY is_active;
-- The query returned two distinct values for the is_active column: TRUE and FALSE. This shows that there are both active and inactive flights in the dataset.


-- 3.1.3: Find flights with seat capacity between 180 and 320.
SELECT *
FROM flights
WHERE seat_capacity BETWEEN 180 AND 320
ORDER BY seat_capacity DESC;
-- The query returned 10 flights with seat capacities ranging from 180 to 320. The results are sorted in descending order of seat capacity.
-- 3.1.3: Find flights to selected destinations.
SELECT *
FROM flights
WHERE origin_country IN ('Thailand', 'Japan', 'Vietnam')
ORDER BY origin_country;
-- The query returned 9 flights originating from Thailand, Japan, and Vietnam. The results are sorted by the origin_country column in ascending order.


-- 3.1.4: Find flights matching a text pattern and handle missing values.
SELECT
    flight_id,
    flight_number,
    COALESCE(origin_country, 'No origin country provided') AS destination
FROM flights
WHERE flight_number LIKE 'VN%'
   OR origin_country IS NULL
ORDER BY flight_number;
-- The query returned 15 flights where the flight number starts with 'VN' or the origin_country is NULL. The COALESCE function is used to replace any NULL values in the origin_country column with the text 'No origin country provided'. The results are sorted by flight_number in ascending order.


-- 3.1.5: Categorize flights by seat capacity.
SELECT
    flight_number,
    seat_capacity,
    CASE
        WHEN seat_capacity >= 300 THEN 'Large capacity'
        WHEN seat_capacity >= 200 THEN 'Medium capacity'
        ELSE 'Smaller capacity'
        END AS capacity_category
FROM flights
WHERE is_active = TRUE
ORDER BY seat_capacity DESC;
-- The query returned 13 active flights categorized by their seat capacity. The results are sorted in descending order of seat capacity, with flights classified as 'Large capacity', 'Medium capacity', or 'Smaller capacity' based on the number of seats available.