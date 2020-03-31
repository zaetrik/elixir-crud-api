defmodule ElixirCrudApi.SongsTest do
  use ElixirCrudApi.DataCase

  alias ElixirCrudApi.Songs

  describe "songs" do
    alias ElixirCrudApi.Songs.Song

    @valid_attrs %{artist_id: 42, genre: [], length: 42, title: "some title"}
    @update_attrs %{artist_id: 43, genre: [], length: 43, title: "some updated title"}
    @invalid_attrs %{artist_id: nil, genre: nil, length: nil, title: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Songs.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Songs.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Songs.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Songs.create_song(@valid_attrs)
      assert song.artist_id == 42
      assert song.genre == []
      assert song.length == 42
      assert song.title == "some title"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Songs.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, %Song{} = song} = Songs.update_song(song, @update_attrs)
      assert song.artist_id == 43
      assert song.genre == []
      assert song.length == 43
      assert song.title == "some updated title"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Songs.update_song(song, @invalid_attrs)
      assert song == Songs.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Songs.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Songs.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Songs.change_song(song)
    end
  end
end
