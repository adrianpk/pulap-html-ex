defmodule Pulap.Repo.Migrations.CreateKeyValues do
  use Ecto.Migration

  def change do
    create table(:key_values, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :set, :string, size: 32
      add :key, :string, size: 255, null: false
      add :value, :string, size: 255, null: false
      add :key_group, :string, size: 32
      add :key_subgroup, :string, size: 32
      add :locale, :string, size: 5
      add :position, :integer
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:key_values, [:created_by_id])
    create index(:key_values, [:updated_by_id])
  end
end
