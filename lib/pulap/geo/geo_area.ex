defmodule Pulap.Geo.GeoArea do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Geo.GeoArea

  schema "geo_areas" do
    field :alternative_name, :string
    field :canonical_name, :string
    field :canonical_name_loc, :string
    field :cards, :string
    field :dialing_code, :string
    field :geolocation, :float
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :is_main, :boolean, default: false
    field :locale, :string
    field :name, :string
    field :name_loc, :string
    field :position, :integer
    field :zip_code, :string
    field :parent_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%GeoArea{} = geo_area, attrs) do
    geo_area
    |> cast(attrs, [:name, :alternative_name, :name_loc, :canonical_name, :canonical_name_loc, :dialing_code, :zip_code, :is_main, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
    |> validate_required([:name, :alternative_name, :name_loc, :canonical_name, :canonical_name_loc, :dialing_code, :zip_code, :is_main, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
  end
end
