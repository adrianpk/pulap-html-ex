defmodule Pulap.App.KeyValue do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.App.KeyValue


  schema "key_values" do
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :key, :string
    field :key_group, :string
    field :key_subgroup, :string
    field :locale, :string
    field :position, :integer
    field :set, :string
    field :value, :string
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%KeyValue{} = key_value, attrs) do
    key_value
    |> cast(attrs, [:set, :key, :value, :key_group, :key_subgroup, :locale, :position, :is_active, :is_logical_deleted])
    |> validate_required([:set, :key, :value, :key_group, :key_subgroup, :locale, :position, :is_active, :is_logical_deleted])
  end
end
