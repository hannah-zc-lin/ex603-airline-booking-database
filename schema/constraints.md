# Constraints

## Primary Key: Unique and can not be NULL
- passengers: passenger_id
- booking_information: booking_id
- flights: flight_id
- airports: airport_id
- flight_routes: (flight_id, airport_id)

## Foreign Key
- booking_information.passenger_id -> passengers.passenger_id

ON DELETE restrict: A passenger cannot be deleted if this passenger has an existing booking. 

- booking_information.flight_id -> flights.flight_id

ON DELETE restrict: A flight cannot be deleted if it has an existing booking. 


- flight_routes.flight_id -> flights.flight_id

ON DELETE cascade: The associate flight route will be delete if a flight is deleted.

- flight_routes.airport_id -> airports.airport_id

ON DELETE cascade: The associate flight route will be delete if a airport is deleted.

## Others
- In passengers, name cannot be null, emaill should be unique
- In flights, flight_number should be unique, capacity cannot be nagative 
- In booking_information, ticket price cannot be negative 
- In flight_routes, airport_role must be departure or arrival 