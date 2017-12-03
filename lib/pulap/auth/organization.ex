defmodule Pulap.Auth.Organization do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Organization


  @primary_key {:id, :binary_id, autogenerate: true}

  schema "organizations" do
    field :annotations, :string
    field :created_by, Ecto.UUID
    field :description, :string
    field :geolocation, :float
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :started_at, :utc_datetime
    field :updated_by_id, Ecto.UUID
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Organization{} = organization, attrs) do
    organization
    |> cast(attrs, [:name, :description, :annotations, :geolocation, :started_at, :created_by, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :annotations, :geolocation, :started_at, :created_by, :is_active, :is_logical_deleted])
  end
end
