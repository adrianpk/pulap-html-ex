defmodule Pulap.App.PropertiesSet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.App.PropertiesSet


  schema "properties_sets" do
    field :description, :string
    field :holder_id, Ecto.UUID
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :started_at, :utc_datetime
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%PropertiesSet{} = properties_set, attrs) do
    properties_set
    |> cast(attrs, [:name, :description, :holder_id, :is_active, :is_logical_deleted, :started_at])
    |> validate_required([:name, :description, :holder_id, :is_active, :is_logical_deleted, :started_at])
  end
end
