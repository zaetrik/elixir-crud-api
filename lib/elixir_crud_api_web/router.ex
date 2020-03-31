defmodule ElixirCrudApiWeb.Router do
  use ElixirCrudApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/artists", ElixirCrudApiWeb do
    pipe_through :api

    get "/", ArtistController, :index
    post "/", ArtistController, :create
    get "/:artistId", ArtistController, :show
    put "/:artistId", ArtistController, :update
    delete "/:artistId", ArtistController, :delete

    get "/:artistId/songs", SongController, :index
    post "/:artistId/songs", SongController, :create
    get "/:artistId/songs/:songId", SongController, :show
    put "/:artistId/songs/:songId", SongController, :update
    delete "/:artistId/songs/:songId", SongController, :delete
  end
end
