-- =================================================================
-- EX 603 Assignment 2 — schema.sql
-- Theme: Airline Booking Database
-- Author: TzuChing Hannah Lin
-- Target: PostgreSQL 14+
-- =================================================================
-- Reset. Reverse creation order, so no dependency blocks a drop.


DROP TABLE IF EXISTS flight_routes CASCADE;
DROP TABLE IF EXISTS booking_information CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS airports CASCADE;
DROP TABLE IF EXISTS passengers CASCADE;


CREATE TABLE passengers (
    passenger_id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone_number VARCHAR(20),

    CONSTRAINT pk_passengers
        PRIMARY KEY (passenger_id),

    CONSTRAINT uq_passengers_email
        UNIQUE (email)
);


CREATE TABLE airports (
    airport_id INTEGER GENERATED ALWAYS AS IDENTITY,
    airport_code VARCHAR(3) NOT NULL,
    airport_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,

    CONSTRAINT pk_airports
        PRIMARY KEY (airport_id),

    CONSTRAINT uq_airports_code
        UNIQUE (airport_code)
);


CREATE TABLE flights (
    flight_id INTEGER GENERATED ALWAYS AS IDENTITY,
    flight_number VARCHAR(10) NOT NULL,
    airline VARCHAR(100) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    capacity INTEGER NOT NULL,
    status VARCHAR(20) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_flights
        PRIMARY KEY (flight_id),

    CONSTRAINT uq_flights_number
        UNIQUE (flight_number),

    CONSTRAINT chk_flights_capacity
        CHECK (capacity > 0),

    CONSTRAINT chk_flights_status
        CHECK (status IN ('scheduled', 'delayed', 'cancelled', 'completed')),

    CONSTRAINT chk_flights_times
        CHECK (arrival_time > departure_time)
);


CREATE TABLE booking_information (
    booking_id INTEGER GENERATED ALWAYS AS IDENTITY,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    book_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ticket_price NUMERIC(10,2) NOT NULL,

    CONSTRAINT pk_bookings
        PRIMARY KEY (booking_id),

    CONSTRAINT fk_bookings_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES passengers (passenger_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_bookings_flight
        FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_bookings_ticket_price
        CHECK (ticket_price >= 0)
);


CREATE TABLE flight_routes (
    flight_id INTEGER NOT NULL,
    airport_id INTEGER NOT NULL,
    airport_role VARCHAR(10) NOT NULL,

    CONSTRAINT pk_flight_routes
        PRIMARY KEY (flight_id, airport_id),

    CONSTRAINT fk_flight_routes_flight
        FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_flight_routes_airport
        FOREIGN KEY (airport_id)
        REFERENCES airports (airport_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_flight_routes_role
        CHECK (airport_role IN ('departure', 'arrival'))
);
