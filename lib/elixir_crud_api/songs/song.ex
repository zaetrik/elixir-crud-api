defmodule ElixirCrudApi.Songs.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :artist_id, :integer
    field :genre, {:array, :string}
    field :length, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title, :genre, :length, :artist_id])
    |> validate_required([:title, :genre, :length, :artist_id])
  end
end
