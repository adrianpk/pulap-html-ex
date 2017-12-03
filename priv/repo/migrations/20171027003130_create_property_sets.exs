defmodule Pulap.Repo.Migrations.CreatePropertySets do
  use Ecto.Migration

  def change do
    create table(:property_sets, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string
      add :holder_id, :uuid
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:property_sets, [:name])
    create index(:property_sets, [:created_by_id])
    create index(:property_sets, [:updated_by_id])

  end
end
