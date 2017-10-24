defmodule Pulap.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :organization_name, :string, size: 32
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :created_by, references(:users, type: :binary_id, on_delete: :nothing)
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :utc_datetime

      timestamps(type: :timestamptz)
    end
    create index(:roles, [:organization_id])
    create index(:roles, [:created_by])

  end

end
