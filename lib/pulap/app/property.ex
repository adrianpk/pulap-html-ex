defmodule Pulap.App.Property do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.App.Property


  schema "properties" do
    field :boolean, :boolean, default: false
    field :date, :date
    field :datetime, :naive_datetime
    field :decimal, :decimal
    field :description, :string
    field :float, :float
    field :geolocation, :float
    field :integer, :integer
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :properties_set_name, :string
    field :property_data_type, :string
    field :string, :string
    field :time, :time
    field :uuid, Ecto.UUID
    field :properties_set_id, :id
    field :created_by, :id
    field :updated_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Property{} = property, attrs) do
    property
    |> cast(attrs, [:properties_set_name, :name, :description, :property_data_type, :boolean, :date, :datetime, :decimal, :decimal, :float, :geolocation, :integer, :string, :time, :uuid, :is_active, :is_logical_deleted])
    |> validate_required([:properties_set_name, :name, :description, :property_data_type, :boolean, :date, :datetime, :decimal, :decimal, :float, :geolocation, :integer, :string, :time, :uuid, :is_active, :is_logical_deleted])
  end
end
