defmodule Dnctopicapi.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :description, :text
      add :long_description, :text
      add :guid, :string
      add :sharing_url, :string
      add :audio_url, :string
      add :duration, :integer

      timestamps()
    end

    create unique_index(:episodes, [:guid])
  end
end
