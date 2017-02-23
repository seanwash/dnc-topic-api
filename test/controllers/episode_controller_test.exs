defmodule Dnctopicapi.EpisodeControllerTest do
  use Dnctopicapi.ConnCase

  alias Dnctopicapi.Episode
  @valid_attrs %{audio_url: "some content", description: "some content", duration: 42, guid: "some content", long_description: "some content", sharing_url: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, episode_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    episode = Repo.insert! %Episode{}
    conn = get conn, episode_path(conn, :show, episode)
    assert json_response(conn, 200)["data"] == %{"id" => episode.id,
      "title" => episode.title,
      "description" => episode.description,
      "long_description" => episode.long_description,
      "guid" => episode.guid,
      "sharing_url" => episode.sharing_url,
      "audio_url" => episode.audio_url,
      "duration" => episode.duration}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, episode_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, episode_path(conn, :create), episode: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Episode, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, episode_path(conn, :create), episode: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    episode = Repo.insert! %Episode{}
    conn = put conn, episode_path(conn, :update, episode), episode: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Episode, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    episode = Repo.insert! %Episode{}
    conn = put conn, episode_path(conn, :update, episode), episode: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    episode = Repo.insert! %Episode{}
    conn = delete conn, episode_path(conn, :delete, episode)
    assert response(conn, 204)
    refute Repo.get(Episode, episode.id)
  end
end
