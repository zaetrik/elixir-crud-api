defmodule ElixirCrudApiWeb.SongController do
  use ElixirCrudApiWeb, :controller

  alias ElixirCrudApi.Songs
  alias ElixirCrudApi.Songs.Song

  action_fallback ElixirCrudApiWeb.FallbackController

  def index(conn, _params) do
    songs = Songs.list_songs()
    render(conn, "index.json", songs: songs)
  end

  def create(conn, %{
        "artistId" => artistId,
        "title" => title,
        "genre" => genre,
        "length" => length
      }) do
    with {:ok, %Song{} = song} <-
           Songs.create_song(%{
             title: title,
             genre: genre,
             length: length,
             artist_id: artistId
           }) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.song_path(conn, :show, song))
      |> render("show.json", song: song)
    end
  end

  def show(conn, %{"songId" => songId}) do
    song = Songs.get_song!(songId)
    render(conn, "show.json", song: song)
  end

  def update(conn, %{
        "songId" => songId,
        "artistId" => artistId,
        "title" => title,
        "genre" => genre,
        "length" => length
      }) do
    song = Songs.get_song!(songId)

    with {:ok, %Song{} = song} <-
           Songs.update_song(song, %{
             title: title,
             genre: genre,
             length: length,
             artist_id: artistId
           }) do
      render(conn, "show.json", song: song)
    end
  end

  def delete(conn, %{"songId" => songId}) do
    song = Songs.get_song!(songId)

    with {:ok, %Song{}} <- Songs.delete_song(song) do
      send_resp(conn, :no_content, "")
    end
  end
end
