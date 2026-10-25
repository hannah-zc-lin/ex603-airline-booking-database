# ex603-airline-booking-database

## Project Summary
This project models a relational database for an airline booking that tracks passengers, flights, booking_information, airports, and flight routes.

## Theme
Airline Booking

## Domain description
This project is about an airline booking system. The system should be able to answer questions such as: Which flight a passenger book? What flights are available? Where a flight depart and arrive? When did a passenger complete a booking, and how much did the ticket cost?

The database keeps track of passengers, flights, airports, and booking_information information, while flight_routes connects flights to their departure and arrival airports.
 
## Schema
The database contains five tables:

1. passengers — stores passenger information.
2. airports — stores airport codes, names, cities, and countries.
3. flights — stores flight information including airline, times, capacity, and status.
4. booking_information — connects passengers to flights and stores the booking time and ticket price.
5. flight_routes — connects flights to airports and identifies each airport as a departure or arrival airport.

The database uses primary keys to uniquely identify records and foreign keys to maintain relationships between tables. flight_routes uses a composite primary key because it connects the relationship between a flight and an airport. I also used RESTRICT for booking_information so historical booking records are not left without a passenger or flight, while CASCADE is used for route records because they depend on the related flight or airport.


### Query Catalogue

| File                     | Query                                   | Business question                                                                                                     |
| ------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `queries/unit4/q4_1.sql` | Q1: Overall booking statistics          | How many bookings and unique passengers are there, and what are the total, average, minimum, and maximum ticket prices?     |
| `queries/unit4/q4_1.sql` | Data inspection                         | Which booking statuses and cancellation reasons show in the data, and how many bookings belong to each combination? |
| `queries/unit4/q4_1.sql` | Q2: Per-flight statistics               | Which flights have the most bookings, and what is the average fare for each flight?                                   |
| `queries/unit4/q4_1.sql` | Q3: `HAVING`                            | Which flights have at least 10 bookings, and what are their booking counts and average fares?                         |
| `queries/unit4/q4_1.sql` | Q4: Two-dimension grouping              | How do booking counts, total fares, average fares, and unique passengers vary by flight and origin country?         |
| `queries/unit4/q4_2.sql` | Q2A: Conditional aggregation            | How many bookings and failed bookings does each flight have, and what is its failure rate?                            |
| `queries/unit4/q4_2.sql` | Q2B: Regional subtotals and grand total | How do booking counts and failure rates compare across countries, and what is the overall failure rate?        |
| `queries/unit4/q4_2.sql` | Q2C: CTE pipeline                       | What is the combined failure rate among flights with at least 10 bookings?                                            |



### Author 
Hannah Lin
