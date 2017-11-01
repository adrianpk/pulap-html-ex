defmodule Pulap.Geo.GeoArea do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Geo.GeoArea


  schema "geo_areas" do
    field :alt_name, :string
    field :canonical_name, :string
    field :cards, :string
    field :dialing_code, :string
    field :geolocation, :float
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :is_main, :boolean, default: false
    field :locale, :string
    field :locale_canonical_name, :string
    field :locale_name, :string
    field :name, :string
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
    |> cast(attrs, [:name, :alt_name, :locale_name, :canonical_name, :locale_canonical_name, :dialing_code, :zip_code, :is_main, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
    |> validate_required([:name, :alt_name, :locale_name, :canonical_name, :locale_canonical_name, :dialing_code, :zip_code, :is_main, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
  end
end
