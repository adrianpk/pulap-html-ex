defmodule Pulap.Auth.UserRole do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.UserRole


  schema "user_roles" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :organization_id, :id
    field :user_id, :id
    field :role_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%UserRole{} = user_role, attrs) do
    user_role
    |> cast(attrs, [:name, :description, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :is_active, :is_logical_deleted])
  end
end
