# Schema Definition

## 1. passengers

Relation: passengers
Primary key: passenger_id

| Attribute | Domain | Description 
|---|---|---|
| passenger_id | Integer | Unique Id for each passenger | 
| name | VARCHAR | Passenger's name |
| email | VARCHAR | Passenger's email |
| phone_number | VARCHAR | Passenger's phone number |


## booking_information_information

Relation: booking_information
Primary key: booking_id

| Attribute | Domain | Description 
|---|---|---|
| booking_id | Integer | Unique Id for each booking |
| passenger_id | Integer | Identify passenger | 
| flight_id | Integer | Identify the flight |
| book_time | TimeStamp | Time when the booking was made |
| ticket_price | Numeric | Ticket price | 


## flights

Relation: flights
Primary key: flight_id

| Attribute | Domain | Description 
|---|---|---|
| flight_id | Integer | Unique Id for each flight | 
| flight_number | VARCHAR | Flight number |
| airline | VARCHAR | Airline name | 
| departure_time | TimeStamp | Departure time of the flight | 
| arrival_time | TimeStamp | Arrival time of the flight |  
| capacity | Integer | How many passengers on this flight | 
| status | VARCHAR | The status of the flight | 


## airports

Relation: airports
Primary key: airport_id

| Attribute | Domain | Description 
|---|---|---|
| airport_id | Integer | Unique Id for each airport | 
| airport_code | VARCHAR | Airport code |
| airport_name | VARCHAR | Airport name | 
| country | VARCHAR | Country of the airport |  
| city | VARCHAR | City of the airport |  

## flights_route

Relation: flights_route
Primary key: flight_id, airport_id

| Attribute | Domain | Description 
|---|---|---|
| airport_id | Integer | Identify airport | 
| flight_id | Integer | Identify flight  | 
| airport_role | VARCHAR | Show it is a departure or arrival airport | 