defmodule Pulap.Biz.Currency do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Currency


  schema "currencies" do
    field :code, :string
    field :icon, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :minor_unit, :string
    field :name, :string
    field :num_code, :string
    field :location_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Currency{} = currency, attrs) do
    currency
    |> cast(attrs, [:code, :num_code, :minor_unit, :name, :icon, :is_active, :is_logical_deleted])
    |> validate_required([:code, :num_code, :minor_unit, :name, :icon, :is_active, :is_logical_deleted])
  end
end
