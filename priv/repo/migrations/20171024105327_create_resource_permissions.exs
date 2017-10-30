defmodule Pulap.Repo.Migrations.CreateResourcePermissions do
  use Ecto.Migration


  def change do
    create table(:resource_permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :organization_name, :string, size: 32
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :tag, :string, size: 16
      add :resource_id, references(:resources, type: :binary_id, on_delete: :nothing)
      add :permission_id, references(:permissions, type: :binary_id, on_delete: :nothing)
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps(type: :timestamptz)
  end

    create index(:resource_permissions, [:organization_id])
    create index(:resource_permissions, [:resource_id])
    create index(:resource_permissions, [:permission_id])
    create index(:resource_permissions, [:created_by_id])
    create index(:resource_permissions, [:updated_by_id])

  end
end
