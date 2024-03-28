# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# hotel_booking

Hotel room booking web application with below
functionalities:
1. List all hotels with feature to filter by location.
2. Allow users to book a room in a hotel by choosing no of rooms, check-in date, check-out
date etc.
3. Display the booked rooms to the user.
4. Allow users to modify the booking details (check-in, checkout dates etc.)
5. Allow user to cancel the booking.


# API's

# List all hotels
Request: http://localhost:3000/hotels

Response:

```
{
  "status": "success",
  "data": [
    {
      "id": 1,
      "name": "Holiday Inn",
      "address": "6, Vivekanadar st",
      "phone": "1234",
      "city": {
        "id": 1,
        "name": "Bangalore",
        "state": "Karnataka",
        "country": "India"
      }
    },
    {
      "id": 2,
      "name": "Lemon tree",
      "address": "6, Vivekanadar st",
      "phone": "1234",
      "city": {
        "id": 1,
        "name": "Bangalore",
        "state": "Karnataka",
        "country": "India"
      }
    }
  ]
}
```

For Filtering by location

Request: http://localhost:3000/hotels?city_id=1


# Create a Booking for a User
Request: 
```
curl --location 'localhost:3000/bookings' \
--header 'Content-Type: application/json' \
--data '{
    "check_in":  "2024-04-01",
    "check_out": "2024-04-02", 
    "hotel_id": 1,
    "number_of_guests": 2,
    "number_of_rooms": 1
}'
```

Response:
```
{
    "status": "success",
    "data": {
        "id": 3,
        "check_in": "2024-04-01",
        "check_out": "2024-04-02",
        "number_of_guests": 2,
        "number_of_rooms": 1,
        "paid_status": "unpaid",
        "status": "pending",
        "total_price": "1000.0",
        "hotel": {
            "id": 1,
            "name": "Holiday Inn",
            "address": "6, Vivekanadar st",
            "phone": "1234",
            "city": {
                "id": 1,
                "name": "Bangalore",
                "state": "Karnataka",
                "country": "India"
            }
        },
        "user": {
            "id": 1,
            "name": "Admin",
            "email": "admin@example.co"
        }
    }
}
```


# Update a booking

Request:
```
curl --location --request PUT 'localhost:3000/bookings/1' \
--header 'Content-Type: application/json' \
--data '{
    "check_in":  "2024-04-01",
    "check_out": "2024-04-02", 
    "hotel_id": 1,
    "number_of_guests": 3,
    "number_of_rooms": 1
}'
```

Response:

```
{
    "status": "success",
    "data": {
        "id": 1,
        "check_in": "2024-04-01",
        "check_out": "2024-04-02",
        "number_of_guests": 3,
        "number_of_rooms": 1,
        "paid_status": "unpaid",
        "status": "pending",
        "total_price": "1000.0",
        "hotel": {
            "id": 1,
            "name": "Holiday Inn",
            "address": "6, Vivekanadar st",
            "phone": "1234",
            "city": {
                "id": 1,
                "name": "Bangalore",
                "state": "Karnataka",
                "country": "India"
            }
        },
        "user": {
            "id": 1,
            "name": "Admin",
            "email": "admin@example.co"
        }
    }
}
```

# Cancel a booking

Request: 
```
curl --location --request POST 'localhost:3000/bookings/1/cancel' \
--data ''
```

Response:
```
{
    "status": "success",
    "message": "Booking cancelled successfully"
}
```


# List user bookings

Request:
```
curl --location 'localhost:3000/users/1/bookings'
```

Response:
```
{
    "status": "success",
    "data": [
        {
            "id": 1,
            "check_in": "2024-04-01",
            "check_out": "2024-04-02",
            "number_of_guests": 3,
            "number_of_rooms": 1,
            "paid_status": "unpaid",
            "status": "canceled",
            "total_price": "1000.0",
            "hotel": {
                "id": 1,
                "name": "Holiday Inn",
                "address": "6, Vivekanadar st",
                "phone": "1234",
                "city": {
                    "id": 1,
                    "name": "Bangalore",
                    "state": "Karnataka",
                    "country": "India"
                }
            },
            "user": {
                "id": 1,
                "name": "Admin",
                "email": "admin@example.co"
            }
        }
    ]
}
```