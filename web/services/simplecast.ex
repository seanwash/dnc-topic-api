defmodule Dnctopicapi.Simplecast do
  require HTTPoison

  alias Dnctopicapi.{Episode, Repo}

  @url System.get_env("SIMPLECAST_API_URL") || Application.get_env(:dnctopicapi, :simplecast_api_url)

  def fetch_episodes do
    case HTTPoison.get(@url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        process_episodes(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def process_episodes(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn (episode) -> find_or_create_episode(episode) end)
  end

  def find_or_create_episode(%{"guid" => guid} = episode_data) do
    result =
      case Repo.get_by(Episode, guid: guid) do
        nil -> %Episode{}
        episode -> episode
      end
      |> Episode.changeset(episode_data)
      |> Repo.insert_or_update

    case result do
      {:ok, episode} -> IO.inspect episode
      {:error, changeset} -> IO.inspect changeset
    end
  end
end
