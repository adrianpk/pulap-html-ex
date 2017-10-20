defmodule Pulap.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.User


  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :annotations, :string
    field :card, :string
    field :created_by, Ecto.UUID
    field :email, :string
    field :family_name, :string
    field :geolocation, Geo.Point
    field :given_name, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :middle_names, :string
    field :password, :string
    field :password_hash, :string
    field :started_at, :utc_datetime
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by, :is_active, :is_logical_deleted])
    |> validate_required([:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by, :is_active, :is_logical_deleted])
  end
end
