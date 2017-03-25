defmodule Dnctopicapi.Episode do
  use Dnctopicapi.Web, :model

  schema "episodes" do
    field :title, :string
    field :description, :string
    field :long_description, :string
    field :guid, :string
    field :sharing_url, :string
    field :audio_url, :string
    field :duration, :integer
    field :published_at, :utc_datetime
    field :published, :boolean
    field :number, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :long_description, :guid, :sharing_url, :audio_url, :duration, :published_at, :published, :number])
    |> validate_required([:title, :description, :long_description, :guid, :sharing_url, :audio_url, :duration, :published_at, :published, :number])
  end

  def newest_first(query) do
    from e in query,
    order_by: [desc: e.published_at]
  end
end
