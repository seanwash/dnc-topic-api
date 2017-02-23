defmodule Dnctopicapi.EpisodeTest do
  use Dnctopicapi.ModelCase

  alias Dnctopicapi.Episode

  @valid_attrs %{audio_url: "some content", description: "some content", duration: 42, guid: "some content", long_description: "some content", sharing_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episode.changeset(%Episode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episode.changeset(%Episode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
