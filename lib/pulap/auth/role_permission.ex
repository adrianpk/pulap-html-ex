defmodule Pulap.Auth.RolePermission do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.RolePermission


  schema "role_permissions" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :organization_id, :id
    field :role_id, :id
    field :permission_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%RolePermission{} = role_permission, attrs) do
    role_permission
    |> cast(attrs, [:name, :description, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :is_active, :is_logical_deleted])
  end
end
