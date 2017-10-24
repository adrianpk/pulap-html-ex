defmodule Pulap.Auth.Permission do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Permission


  schema "permissions" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :organization_name, :string
    field :started_at, :utc_datetime
    field :organization_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Permission{} = permission, attrs) do
    permission
    |> cast(attrs, [:id, :name, :description, :organization_name, :is_active, :is_logical_deleted, :started_at])
    |> validate_required([:id, :name, :description, :organization_name, :is_active, :is_logical_deleted, :started_at])
  end
end
