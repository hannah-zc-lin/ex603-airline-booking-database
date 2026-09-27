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



### Author 
Hannah Lin
