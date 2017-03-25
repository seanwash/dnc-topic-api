defmodule Dnctopicapi.Repo.Migrations.AddAdditionalAttrsToEpisodes do
  use Ecto.Migration

  def change do
    alter table(:episodes) do
      add :published_at, :utc_datetime
      add :published, :boolean, default: false
      add :number, :integer
    end
  end
end
