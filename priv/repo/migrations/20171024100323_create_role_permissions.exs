defmodule Pulap.Repo.Migrations.CreateRolePermissions do
  use Ecto.Migration

  def change do
    create table(:role_permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :tag, :string, size: 16
      add :organization_name, :string, size: 32
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :role_id, references(:roles, type: :binary_id, on_delete: :nothing)
      add :permission_id, references(:permissions, type: :binary_id, on_delete: :nothing)
      add :created_by, references(:users, type: :binary_id, on_delete: :nothing)
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :utc_datetime

      timestamps(type: :timestamptz)
    end

    create index(:role_permissions, [:organization_id])
    create index(:role_permissions, [:role_id])
    create index(:role_permissions, [:permission_id])
    create index(:role_permissions, [:created_by])
  end
end