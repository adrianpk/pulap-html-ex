defmodule Pulap.Repo.Migrations.CreateKeyvalues do
  use Ecto.Migration

  def change do
    create table(:key_values, primary_key: false) do
      add :set, :string
      add :key, :string
      add :value, :string
      add :key_group, :string
      add :key_subgroup, :string
      add :locale, :string
      add :position, :integer
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:key_values, [:created_by_id])
    create index(:key_values, [:updated_by_id])
  end
end
