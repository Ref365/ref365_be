# REF365 | Back-end Application 
Repository: https://github.com/Ref365  
Hosted on Heroku: https://ref365-be.herokuapp.com  
## Local Setup 
````
git clone git@github.com:Ref365/ref365_be.git
cd ref365_be
bundle install
rake db:{create,migrate,seed}
````

## Test Suite
To run the test suite (terminal command):
````
bundle exec rspec
````
- RSpec<br>
- SimpleCov<br>

## Endpoints - GraphQL 
To start the local server (terminal command):
````
rails s
````
Local deployment endpoint if using Postman: http://localhost:3000/graphql


Local deployment developer interface: http://localhost:3000/graphiql


## Mutations and Queries

- [Create a User](#Create-a-User)
- [Create an Event for a User](#Create-an-Event-for-a-User)
- [Query a User](#Query-a-User)
- [Query all Users](#Query-all-Users)
- [Query a User's Events](#Query-a-User's-Events)

## Database Schema
<img src="https://user-images.githubusercontent.com/53151022/79116329-c936ff80-7d4d-11ea-9de9-a49516cc27b5.png" alt="DB Schema Screen Shot" width="400"/>

#### Create a User
* Request
````
mutation {
  createUser(input: {
    name: "Ken Mauer",
    email: "Ken.Mauer@example.com"
  }) {
  user {
    id
    name
    email
  }}
}
````   
* Response
````
{
  "data": {
    "createUser": {
      "user": {
        "id": "1",
        "name": "Ken Mauer",
        "email": "Ken.Mauer@example.com"
      }
    }
  }
}
````
#### Create an Event for a User
* Request
````
mutation {
  createEvent(input: {
    userId: 1,
    title: "Soccer Game",
    notes: "Main ref",
    date: "2018-07-21 00:00:00 UTC",
    time: "2020-04-04 14:00:00 UTC",
    mileage: 13.1,
    income: 122.33
  }) {
  event {
    id
    title
    notes
    date
    time
    mileage
    income
    dateTime
  }}
}
````
* Response
````
{
  "data": {
    "createEvent": {
      "event": {
        "id": "1",
        "title": "Soccer Game",
        "notes": "Main ref",
        "date": "2018-07-21 00:00:00 UTC",
        "time": "2020-04-04 14:00:00 UTC",
        "mileage": 13.1,
        "income": 122.33,
        "dateTime": "2018-07-21T14:00:00+00:00"
      }
    }
  }
}
````
#### Query a User
* Request
````
{ user(id: 1){
  	id
  	name
  	email
	}
}
````
* Response
````
{
  "data": {
    "user": {
      "id": "1",
      "name": "Ken Mauer",
      "email": "Ken.Mauer@example.com"
    }
  }
}
````
#### Query all Users
* Request
````
{ users {
  	id
  	name
  	email
	}
}
````
* Response
````
{
  "data": {
    "users": [
      {
        "id": "1",
        "name": "Ken Mauer",
        "email": "Ken.Mauer@example.com"
      },
      {
        "id": "2",
        "name": "Example User 2",
        "email": "Example.User2@example.com"
      },
      {
        "id": "3",
        "name": "Example User 3",
        "email": "Example.User3@example.com"
    ]
  }
}
````
#### Query a User's Events
* Request
````
{ user(id: 1) {
  id
  name
  email
  events {
    id
    title
    notes
    date
    time
    mileage
    income
    dateTime
  }}
}
````
* Response
````
{
  "data": {
    "user": {
      "id": "1",
      "name": "Plutarch",
      "email": "gaylord_mueller@christiansen.co",
      "events": [
        {
          "id": "1",
          "title": "Soccer Game",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13.1,
          "income": 122.33,
          "dateTime": "2018-07-21T14:00:00+00:00"
        },
        {
          "id": "2",
          "title": "Softball Varsity Game",
          "notes": "Team 2 had a no hitter.",
          "date": "2018-03-21 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 99.15,
          "income": 905.33,
          "dateTime": "2018-03-21T14:00:00+00:00"
        },
        {
          "id": "3",
          "title": "Holiday Tournament, game 1",
          "notes": "T'd Coach Smith, 3rd quarter.",
          "date": "2018-12-22 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 50.35,
          "income": 518.97,
          "dateTime": "2018-12-22T14:00:00+00:00"
        }
      ]
    }
  }
}
````
