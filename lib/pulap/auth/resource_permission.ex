defmodule Pulap.Auth.ResourcePermission do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.ResourcePermission


  schema "resource_permissions" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :started_at, :utc_datetime
    field :organization_id, :id
    field :resource_id, :id
    field :permission_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%ResourcePermission{} = resource_permission, attrs) do
    resource_permission
    |> cast(attrs, [:name, :description, :is_active, :is_logical_deleted, :started_at])
    |> validate_required([:name, :description, :is_active, :is_logical_deleted, :started_at])
  end
end
