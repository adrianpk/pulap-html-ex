defmodule Pulap.Auth.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Profile


  schema "profiles" do
    field :anniversary_date, :utc_datetime
    field :annotations, :string
    field :avatar, :binary
    field :avatar_path, :string
    field :bio, :string
    field :cards, :string
    field :description, :string
    field :email, :string
    field :geolocation, :float
    field :header, :binary
    field :header_path, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :moto, :string
    field :name, :string
    field :started_at, :utc_datetime
    field :website, :string
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Profile{} = profile, attrs) do
    profile
    |> cast(attrs, [:name, :email, :description, :bio, :moto, :website, :anniversary_date, :avatar_path, :avatar, :header_path, :header, :cards, :annotations, :geolocation, :is_active, :is_logical_deleted, :started_at])
    |> validate_required([:name, :email, :description, :bio, :moto, :website, :anniversary_date, :avatar_path, :avatar, :header_path, :header, :cards, :annotations, :geolocation, :is_active, :is_logical_deleted, :started_at])
  end
end
