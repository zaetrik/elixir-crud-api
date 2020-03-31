defmodule ElixirCrudApiWeb.SongView do
  use ElixirCrudApiWeb, :view
  alias ElixirCrudApiWeb.SongView

  def render("index.json", %{songs: songs}) do
    render_many(songs, SongView, "song.json")
  end

  def render("show.json", %{song: song}) do
    render_one(song, SongView, "song.json")
  end

  def render("song.json", %{song: song}) do
    %{
      id: song.id,
      title: song.title,
      genre: song.genre,
      length: song.length,
      artist_id: song.artist_id
    }
  end
end
