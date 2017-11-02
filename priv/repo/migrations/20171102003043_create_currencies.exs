defmodule Pulap.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :num_code, :string, size: 8
      add :minor_unit, :string, size: 4
      add :name, :string, size: 64
      add :icon, :string
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :location_id, references(:geo_areas, type: :binary_id, on_delete: :nothing)
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:currencies, [:location_id])
    create index(:currencies, [:created_by_id])
    create index(:currencies, [:updated_by_id])
  end
end
