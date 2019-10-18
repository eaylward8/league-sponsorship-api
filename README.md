# README

## League Sponsorship API

### Simple Rails 5.2 API application with 3 routes
 * League index
 * League create
 * League find (find leagues based on provided location, radius, and budget)

### Get up and running locally
* Clone this repo
* Run `bin/setup` to install dependencies and migrate and seed the database
   * **Note:** You will need a postgresql server running.
* Start a server on `localhost:3000` with `bin/rails server`
* Run specs with `bin/rake`

### Routes
Interact with this application via cURL or an API Client like Postman.
* League index
   * `curl -X GET localhost:3000/api/v1/leagues`
* League create
   * `curl -X POST localhost:3000/api/v1/leagues -H "Content-Type: application/json" -d '{ "league": {"name": "The Best League", "price": 1000, "lat": 40, "lng": 100 }}'`
* League find
   * `curl -X GET localhost:3000/api/v1/leagues/find -H "Content-Type: application/json" -d '{"search_location": [1,1], "radius": 5, "budget": 8000}'`

### Heroku
This application is deployed on Heroku. All of the above requests will work for the Heroku app; simply replace
`localhost:3000` with `https://ea-league-sponsorship.herokuapp.com`.