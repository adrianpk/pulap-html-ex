defmodule Pulap.App.PropertySet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.App.PropertySet


  schema "property_sets" do
    field :description, :string
    field :holder_id, Ecto.UUID
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%PropertySet{} = property_set, attrs) do
    property_set
    |> cast(attrs, [:name, :description, :holder_id, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :holder_id, :is_active, :is_logical_deleted])
  end
end
