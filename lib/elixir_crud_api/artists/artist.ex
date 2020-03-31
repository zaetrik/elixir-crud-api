defmodule ElixirCrudApi.Artists.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
