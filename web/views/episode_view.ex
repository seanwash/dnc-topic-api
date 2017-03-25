defmodule Dnctopicapi.EpisodeView do
  use Dnctopicapi.Web, :view

  def render("index.json", %{episodes: episodes}) do
    %{data: render_many(episodes, Dnctopicapi.EpisodeView, "episode.json")}
  end

  def render("show.json", %{episode: episode}) do
    %{data: render_one(episode, Dnctopicapi.EpisodeView, "episode.json")}
  end

  def render("episode.json", %{episode: episode}) do
    %{id: episode.id,
      title: episode.title,
      description: episode.description,
      long_description: episode.long_description,
      guid: episode.guid,
      sharing_url: episode.sharing_url,
      audio_url: episode.audio_url,
      duration: episode.duration,
      published_at: episode.published_at,
      published: episode.published,
      number: episode.number}
  end
end
