defmodule Pulap.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :organization_name, :string, size: 32
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps(type: :timestamptz)
    end

    create index(:permissions, [:organization_id])
    create index(:permissions, [:created_by_id])
    create index(:permissions, [:updated_by_id])

  end
end
