# Unit 2 — Reasoning

## Creation Order

The tables are created in this order:

1. `passengers`
2. `airports`
3. `flights`
4. `booking_information`
5. `flight_routes`

`passengers` and `airports` do not reference other tables, so they can be created first. `flights` does not have a direct foreign key to another table, so it can be created next. `booking_information` references both `passengers` and `flights`, so those tables must exist first. `flight_routes` references both `flights` and `airports`, so it is created last.

## The constraints table

| Foreign Key                                       | ON DELETE | Reason                                                          |
| ------------------------------------------------- | --------- | --------------------------------------------------------------- |
| `booking_information.passenger_id → passengers.passenger_id` | RESTRICT  | Prevent a passenger with existing booking_information from being deleted. |
| `booking_information.flight_id → flights.flight_id`          | RESTRICT  | Prevent a flight with existing booking_information from being deleted.    |
| `flight_routes.flight_id → flights.flight_id`     | CASCADE   | Remove route records that depend on a deleted flight.          |
| `flight_routes.airport_id → airports.airport_id`  | CASCADE   | Remove route records that depend on a deleted airport.         |

I select RESTRICT for booking_information.passenger_id because a passenger may have booking history, and removing the passenger would leave a booking without a valid passenger. The same reason applies to booking_information.flight_id. I do not want a flight with existing booking_information to be deleted because those booking records are still connected to that flight. 
For flight_routes.flight_id, I chose CASCADE because route data exists only as an extension of the flight itself. Similarly, I used CASCADE for flight_routes.airport_id because removing an airport invalidates any routes tied to it.


## The CHECK constraints

- The flights.capacity constraint requires the capacity to be a positive value to prevent zero or a negative number of available passenger spaces.
- The flights.status constraint limits the status to only scheduled, delayed, cancelled, or completed to avoid inconsistent input.
- The flights.departure_time and arrival_time constraint requires the arrival time to be later than the departure time. 
- The booking_information.ticket_price constraint requires the ticket price to be >= 0 to avoid negative ticket price.
- The flight_routes.airport_role constraint limits the role to departure or arrival to avoid inconsistent input.
