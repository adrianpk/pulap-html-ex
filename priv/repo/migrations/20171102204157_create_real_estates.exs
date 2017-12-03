defmodule Pulap.Repo.Migrations.CreateRealEstates do
  use Ecto.Migration

  def change do
    create table(:real_estates, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 32, null: false
      add :short_description, :string, size: 128
      add :description, :text
      add :geo_area_name, :string, size: 255
      add :geo_area_name_loc, :string, size: 255
      add :geo_area_canonical_name, :string, size: 255
      add :geo_area_canonical_name_loc, :string, size: 255
      add :street, :string, size: 64
      add :street_number, :string, size: 8
      add :block, :string, size: 8
      add :floor, :string, size: 4
      add :apartment_number, :string, size: 6
      add :property_type_val_en, :string, size: 16
      add :property_type_val_loc, :string, size: 16
      add :total_area_m2, :float
      add :indoor_area_m2, :float
      add :price, :float
      add :price_per_square_meter, :float
      add :suggested_installment_loan, :float
      add :type_of_building_val_en, :string, size: 16
      add :type_of_building_val_loc, :string, size: 16
      add :year_of_construction, :integer
      add :room_height_cm, :integer
      add :number_of_rooms, :integer
      add :number_of_bedroms, :integer
      add :kitchen_type_val_en, :string, size: 16
      add :kitchen_type_val_loc, :string, size: 16
      add :number_of_bathrooms, :integer
      add :bathroom_area_m2, :float
      add :heating_type_val_en, :string, size: 16
      add :heating_type_val_loc, :string, size: 16
      add :accessible_without_stairs, :boolean, default: false, null: false
      add :elevator, :boolean, default: false, null: false
      add :terrace, :boolean, default: false, null: false
      add :backyard, :boolean, default: false, null: false
      add :balcony, :boolean, default: false, null: false
      add :number_of_balconies, :integer
      add :furniture_set, :boolean, default: false, null: false
      add :house_equipment, :boolean, default: false, null: false
      add :house_equipment_description, :text
      add :active, :boolean, default: false, null: false
      add :logical_deleted, :boolean, default: false, null: false
      add :cards, :jsonb
      add :geolocation, :float
      add :locale, :string
      add :position, :integer
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :geo_area_id, references(:geo_areas, type: :uuid, on_delete: :nothing)
      add :property_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :currency_id, references(:currencies, type: :uuid, on_delete: :nothing)
      add :currency_code, :string, size: 4
      add :currency_symbol, :string, size: 4
      add :type_of_building_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :kitchen_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :heating_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:real_estates, [:geo_area_id])
    create index(:real_estates, [:property_type_id])
    create index(:real_estates, [:currency_id])
    create index(:real_estates, [:type_of_building_id])
    create index(:real_estates, [:kitchen_type_id])
    create index(:real_estates, [:heating_type_id])
    create index(:real_estates, [:created_by_id])
    create index(:real_estates, [:updated_by_id])
  end
end
