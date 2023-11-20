### Installation instructions:

1. [Install Rails](https://gorails.com/setup) 
1. I used `postgres` as my database, so follow the instructions in the rails installation guide for that if you don't already have it on your system
  1. I used [rbenv](https://github.com/rbenv/rbenv) and [nvm](https://github.com/nvm-sh/nvm) instead of `asdf`, but it shouldn't make a huge difference.
1. [Install Redis](https://redis.io/docs/install/install-redis/)
1. Clone this repo: `git clone git@github.com:jeffday/henry-challenge.git`
1. Install gems `cd henryc; bundle install`
1. Run the server `rails s`
1. Put some test data in the database so the endpoints actually return something interesting: `rake db:populate_database`
1. Grab [Postman](https://www.postman.com/downloads/) or another API Client to test the different API endpoints:

### API Definition

Allows providers to submit times they are available for appointments
```
 POST /openings
    provider_id: id
    start: datetime
    end: datetime
```

Allows a client to retrieve a list of available appointment slots
``` 
GET /appointments
    provider_id: id
```

Allows clients to reserve an available appointment slot
```  
POST /reservations
    appointment_id: id
    client_id: id
```

Allows clients to confirm their reservation
```  
PUT /reservations
    reservation_id: id
```

### Testing

I've got a basic set of unit tests that verify the requirements are followed; you can run them with `rails test`
