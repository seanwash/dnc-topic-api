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

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :long_description, :guid, :sharing_url, :audio_url, :duration])
    |> validate_required([:title, :description, :long_description, :guid, :sharing_url, :audio_url, :duration])
  end

  def newest_first(query) do
    from e in query,
    order_by: [asc: e.inserted_at]
  end
end
