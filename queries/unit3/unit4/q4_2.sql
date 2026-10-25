
-- Q1
SELECT
    f.flight_id,
    COUNT(b.booking_id) AS total_bookings,
    SUM(
        CASE
            WHEN b.booking_status IN ('cancelled', 'disputed')
                THEN 1
            ELSE 0
        END
    ) AS failed_bookings,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN b.booking_status IN ('cancelled', 'disputed')
                    THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(b.booking_id), 0),
        2
    ) AS failure_rate_percent
FROM flights AS f
LEFT JOIN bookings AS b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id
ORDER BY failure_rate_percent DESC NULLS LAST, f.flight_id;


-- Q2
SELECT
    CASE
        WHEN GROUPING(f.origin_country) = 1 THEN 'ALL REGIONS'
        ELSE f.origin_country
    END AS region,
    COUNT(b.booking_id) AS total_bookings,
    SUM(
        CASE
            WHEN b.booking_status IN ('cancelled', 'disputed')
                THEN 1
            ELSE 0
        END
    ) AS failed_bookings,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN b.booking_status IN ('cancelled', 'disputed')
                    THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(b.booking_id), 0),
        2
    ) AS failure_rate_percent
FROM flights AS f
LEFT JOIN bookings AS b
    ON f.flight_id = b.flight_id
GROUP BY ROLLUP (f.origin_country)
ORDER BY
    GROUPING(f.origin_country),
    f.origin_country;


-- Q3
WITH flight_summary AS (
    SELECT
        f.flight_id,
        COUNT(b.booking_id) AS total_bookings,
        SUM(
            CASE
                WHEN b.booking_status IN ('cancelled', 'disputed')
                    THEN 1
                ELSE 0
            END
        ) AS failed_bookings
    FROM flights AS f
    JOIN bookings AS b
        ON f.flight_id = b.flight_id
    GROUP BY f.flight_id
),
high_volume_flights AS (
    SELECT
        flight_id,
        total_bookings,
        failed_bookings
    FROM flight_summary
    WHERE total_bookings >= 10
)
SELECT
    COUNT(*) AS high_volume_flight_count,
    SUM(total_bookings) AS total_bookings,
    SUM(failed_bookings) AS failed_bookings,
    ROUND(
        100.0 * SUM(failed_bookings)
        / NULLIF(SUM(total_bookings), 0),
        2
    ) AS baseline_failure_rate_percent
FROM high_volume_flights;