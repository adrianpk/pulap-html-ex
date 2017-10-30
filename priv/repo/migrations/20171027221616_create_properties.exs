defmodule Pulap.Repo.Migrations.CreateProperties do
  use Ecto.Migration

  def change do
    create table(:properties, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :properties_set_id, references(:properties_sets, type: :binary_id, on_delete: :nothing)
      add :properties_set_name, :string
      add :name, :string
      add :description, :string
      add :property_data_type, :string
      add :boolean, :boolean, default: false, null: false
      add :date, :date
      add :datetime, :naive_datetime
      add :decimal, :decimal
      add :float, :float
      add :geolocation, :float
      add :integer, :integer
      add :string, :string
      add :time, :time
      add :uuid, :uuid
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:properties, [:properties_set_id])
    create index(:properties, [:created_by_id])
    create index(:properties, [:updated_by_id])

  end
end
