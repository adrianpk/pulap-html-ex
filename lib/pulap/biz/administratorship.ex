defmodule Pulap.Biz.Administratorship do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Administratorship


  schema "administratorships" do
    field :ends_at, :utc_datetime
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :started_at, :utc_datetime
    field :user_id, :id
    field :organization_id, :id
    field :real_estate_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Administratorship{} = administratorship, attrs) do
    administratorship
    |> cast(attrs, [:started_at, :ends_at, :is_active, :is_logical_deleted])
    |> validate_required([:started_at, :ends_at, :is_active, :is_logical_deleted])
  end
end
