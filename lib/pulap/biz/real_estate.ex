defmodule Pulap.Biz.RealEstate do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Biz.RealEstate


  schema "real_estates" do
    field :room_height_cm, :integer
    field :price_per_square_meter, :float
    field :type_of_building_val_loc, :string
    field :geo_area_canonical_loc, :string
    field :geo_area_canonical, :string
    field :property_type_val_en, :string
    field :terrace, :boolean, default: false
    field :geolocation, :float
    field :heating_type_val_loc, :string
    field :number_of_balconies, :integer
    field :suggested_installment_loan, :float
    field :locale, :string
    field :number_of_bedroms, :integer
    field :property_type_val_loc, :string
    field :heating_type_val_en, :string
    field :currency_code, :string
    field :currency_symbol, :string
    field :is_logical_deleted, :boolean, default: false
    field :street_number, :string
    field :bathroom_area_m2, :float
    field :balcony, :boolean, default: false
    field :short_description, :string
    field :total_area_m2, :float
    field :number_of_bathrooms, :integer
    field :apartment_number, :string
    field :price, :float
    field :street, :string
    field :number_of_rooms, :integer
    field :type_of_building_val_en, :string
    field :block, :string
    field :kitchen_type_val_en, :string
    field :is_active, :boolean, default: false
    field :indoor_area_m2, :float
    field :description, :string
    field :elevator, :boolean, default: false
    field :house_equipment_description, :string
    field :year_of_construction, :integer
    field :backyard, :boolean, default: false
    field :furniture_set, :boolean, default: false
    field :active, :boolean, default: false
    field :kitchen_type_val_loc, :string
    field :position, :integer
    field :logical_deleted, :boolean, default: false
    field :house_equipment, :boolean, default: false
    field :cards, :string
    field :accessible_without_stairs, :boolean, default: false
    field :name, :string
    field :floor, :string
    field :geo_area_id, :id
    field :property_type_id, :id
    field :currency_id, :id
    field :type_of_building_id, :id
    field :kitchen_type_id, :id
    field :heating_type_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [:name, :short_description, :description, :geo_area_canonical, :geo_area_canonical_loc, :street, :street_number, :block, :floor, :apartment_number, :property_type_val_en, :property_type_val_loc, :total_area_m2, :indoor_area_m2, :price, :price_per_square_meter, :suggested_installment_loan, :currency_code, :currency_symbol, :type_of_building_val_en, :type_of_building_val_loc, :year_of_construction, :room_height_cm, :number_of_rooms, :number_of_bedroms, :kitchen_type_val_en, :kitchen_type_val_loc, :number_of_bathrooms, :bathroom_area_m2, :heating_type_val_en, :heating_type_val_loc, :accessible_without_stairs, :elevator, :terrace, :backyard, :balcony, :number_of_balconies, :furniture_set, :house_equipment, :house_equipment_description, :active, :logical_deleted, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
    |> validate_required([:name, :short_description, :description, :geo_area_canonical, :geo_area_canonical_loc, :street, :street_number, :block, :floor, :apartment_number, :property_type_val_en, :property_type_val_loc, :total_area_m2, :indoor_area_m2, :price, :price_per_square_meter, :suggested_installment_loan, :currency_code, :currency_symbol, :type_of_building_val_en, :type_of_building_val_loc, :year_of_construction, :room_height_cm, :number_of_rooms, :number_of_bedroms, :kitchen_type_val_en, :kitchen_type_val_loc, :number_of_bathrooms, :bathroom_area_m2, :heating_type_val_en, :heating_type_val_loc, :accessible_without_stairs, :elevator, :terrace, :backyard, :balcony, :number_of_balconies, :furniture_set, :house_equipment, :house_equipment_description, :active, :logical_deleted, :cards, :geolocation, :locale, :position, :is_active, :is_logical_deleted])
  end
end
