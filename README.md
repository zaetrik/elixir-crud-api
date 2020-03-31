# Try A New Language Series: ELIXIR

In the `Try A New Language Series` I take a new programming language that looks promising and implement a simple CRUD API in it.

In this part I took the programming language `Elixir`.

This project uses the `Phoenix` framework.

The API can store artists and their songs in a database (Postgres) and lets you perform basic CRUD operations.

## Usage

You will need `Elixir` on your machine.

To start the Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate the database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## API

- /artists

        GET => Get all artists
            Response => [
                {
                    "description": "This is a description",
                    "id": 1,
                    "name": "Example Artist"
                }
            ]

        POST => Create a new artist
            Body => {
                "name": "Example Artist",
                "description": "This is a description"
            }

            Response => {
                "description": "This is a description",
                "id": 1,
                "name": "Example Artist"
            }


- /artists/{artistId}

        GET => Get an artist by id
            Response => {
                "description": "This is a description",
                "id": 1,
                "name": "Example Artist"
            }
            

        PUT => Update an artist
            Body => {
                "name": "Updated Example Artist",
                "description": "This is a description"
            }

            Response => {
                "description": "This is a description",
                "id": 1,
                "name": "Example Artist"
            }
        
        DELETE => Delete an artist by id

- /artists/{artistId}/songs

        GET => Get all songs from an artist by id
            Response => [
				{
					"artist_id": 1,
					"genre": [
						"Indie Poptism"
					],
					"id": 1,
					"length": 180,
					"title": "good morning"
				}
            ]

        POST => Create a new song for an artist by id
            Body => {
                "title": "good morning",
                "genre": ["Indie Poptism"],
                "length": 180
            }

            Response => {
				"artist_id": 1,
				"genre": [
					"Indie Poptism"
				],
				"id": 1,
				"length": 180,
				"title": "good morning"
			}
    
- /artists/{artistId}/songs/{songId}

        GET => Get a song from an artist by artistId and songId
            Response => {
				"artist_id": 1,
				"genre": [
					"Indie Poptism"
				],
				"id": 1,
				"length": 180,
				"title": "good morning"
			}
        
        PUT => Update a song from an artist by artistId and songId
            Body => {
                "title": "updated song title",
                "genre": ["Indie Poptism"],
                "length": 180
            }

            Response => {
                "title": "updated song title",
                "genre": ["Indie Poptism"],
                "length": 180
            }
        
        DELETE => Delete a song from artist by artistId and songId




