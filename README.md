### Quick setup guide
````
git clone git@github.com:Ref365/ref365_be.git
cd ref365_be
bundle install
rake db:{create,migrate,seed}
rails s
````

visit http://localhost:3000/
<img width="295" alt="Screen Shot 2020-04-06 at 2 41 37 PM" src="https://user-images.githubusercontent.com/53151022/78598455-f72fb780-7814-11ea-9da0-069a75b76333.png">


### REF365 - Back-end Application 
https://github.com/Ref365  
AWS Link Coming Soon...

### Test Suite
- Rspec<br>
- SimpleCov<br>

### Endpoints - GraphQL 
For local deploment:
````
http://localhost:3000/graphiql
````

To create an event:
````
# request
mutation {
  createEvent(input: {
    userId: 1,
    title: "Soccer",
    notes: "Main ref",
    date: "2018-07-21 00:00:00 UTC",
    time: "2020-04-04 14:00:00 UTC",
    mileage: 13,
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
  }
  errors
}
}

#response
{
  "data": {
    "createEvent": {
      "event": {
        "id": "12",
        "title": "Soccer",
        "notes": "Main ref",
        "date": "2018-07-21 00:00:00 UTC",
        "time": "2020-04-04 14:00:00 UTC",
        "mileage": 13,
        "income": 122.33
      },
      "errors": []
    }
  }
}
````

To retrieve an event:
````
# request
{ user(id: 1) {
  id
  events {
    id
    title
    notes
    date
    time
    mileage
    income
  }
}

}

#response
{
  "data": {
    "user": {
      "id": "1",
      "events": [
        {
          "id": "1",
          "title": "Fix San",
          "notes": "There's only one life-form as intelligent as me within thirty parsecs of here and that's me.",
          "date": "2018-11-21 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 65.96,
          "income": 771.96
        },
        {
          "id": "2",
          "title": "Span",
          "notes": "I wish you'd just tell me rather trying to engage my enthusiasm, because I haven't got one.",
          "date": "2018-08-01 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 98.92,
          "income": 226.21
        },
        {
          "id": "3",
          "title": "Treeflex",
          "notes": "I think you ought to know I'm feeling very depressed.",
          "date": "2018-06-17 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 88.84,
          "income": 362.17
        },
        {
          "id": "4",
          "title": "Fintone",
          "notes": "Here I am, brain the size of a planet, and they tell me to take you up to the bridge. Call that job satisfaction? 'Cos I don't.",
          "date": "2018-12-15 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 11.41,
          "income": 306.65
        },
        {
          "id": "5",
          "title": "Cardguard",
          "notes": "I won't enjoy it.",
          "date": "2018-04-05 00:00:00 UTC",
          "time": "2020-04-07 14:00:00 UTC",
          "mileage": 96.93,
          "income": 861.63
        },
        {
          "id": "6",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13,
          "income": 122.33
        },
        {
          "id": "7",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13,
          "income": 122.33
        },
        {
          "id": "8",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13,
          "income": 122.33
        },
        {
          "id": "9",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13.12,
          "income": 122.33
        },
        {
          "id": "10",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13,
          "income": 122.33
        },
        {
          "id": "11",
          "title": "Soccer",
          "notes": "Main ref",
          "date": "2018-07-21 00:00:00 UTC",
          "time": "2020-04-04 14:00:00 UTC",
          "mileage": 13,
          "income": 122.33
        }
      ]
    }
  }
}
````



