defmodule ElixirCrudApiWeb.ArtistView do
  use ElixirCrudApiWeb, :view
  alias ElixirCrudApiWeb.ArtistView

  def render("index.json", %{artists: artists}) do
    render_many(artists, ArtistView, "artist.json")
  end

  def render("show.json", %{artist: artist}) do
    render_one(artist, ArtistView, "artist.json")
  end

  def render("artist.json", %{artist: artist}) do
    %{id: artist.id, name: artist.name, description: artist.description}
  end
end
