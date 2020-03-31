defmodule ElixirCrudApiWeb.ArtistController do
  use ElixirCrudApiWeb, :controller

  alias ElixirCrudApi.Artists
  alias ElixirCrudApi.Artists.Artist

  action_fallback ElixirCrudApiWeb.FallbackController

  def index(conn, _params) do
    artists = Artists.list_artists()
    render(conn, "index.json", artists: artists)
  end

  def create(conn, %{"name" => name, "description" => description}) do
    with {:ok, %Artist{} = artist} <-
           Artists.create_artist(%{name: name, description: description}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.artist_path(conn, :show, artist))
      |> render("show.json", artist: artist)
    end
  end

  def show(conn, %{"artistId" => artistId}) do
    artist = Artists.get_artist!(artistId)
    render(conn, "show.json", artist: artist)
  end

  def update(conn, %{"artistId" => artistId, "name" => name, "description" => description}) do
    artist = Artists.get_artist!(artistId)

    with {:ok, %Artist{} = artist} <-
           Artists.update_artist(artist, %{name: name, description: description}) do
      render(conn, "show.json", artist: artist)
    end
  end

  def delete(conn, %{"artistId" => artistId}) do
    artist = Artists.get_artist!(artistId)

    with {:ok, %Artist{}} <- Artists.delete_artist(artist) do
      send_resp(conn, :no_content, "")
    end
  end
end
