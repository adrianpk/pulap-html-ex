defmodule Pulap.Auth.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Role


  schema "roles" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :started_at, :utc_datetime
    field :organization_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Role{} = role, attrs) do
    role
    |> cast(attrs, [:name, :description, :is_active, :is_logical_deleted, :started_at])
    |> validate_required([:name, :description, :is_active, :is_logical_deleted, :started_at])
  end
end
