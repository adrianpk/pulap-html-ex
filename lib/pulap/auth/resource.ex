defmodule Pulap.Auth.Resource do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Resource


  schema "resources" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :organization_name, :string
    field :tag, :string
    field :organization_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Resource{} = resource, attrs) do
    resource
    |> cast(attrs, [:name, :description, :tag, :organization_name, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :tag, :organization_name, :is_active, :is_logical_deleted])
  end
end
