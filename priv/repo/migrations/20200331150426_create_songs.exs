defmodule ElixirCrudApi.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :title, :string
      add :genre, {:array, :string}
      add :length, :integer
      add :artist_id, :integer

      timestamps()
    end

  end
end
