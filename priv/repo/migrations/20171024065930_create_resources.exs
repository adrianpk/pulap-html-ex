defmodule Pulap.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :tag, :string, size: 16
      add :organization_name, :string, size: 32
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :created_by, :binary_id, null: false
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :utc_datetime

      timestamps(type: :timestamptz)
    end

    create index(:resources, [:organization_id])
    create index(:resources, [:created_by])
  end
end
