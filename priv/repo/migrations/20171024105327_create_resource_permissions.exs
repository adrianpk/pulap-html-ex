defmodule Pulap.Repo.Migrations.CreateResourcePermissions do
  use Ecto.Migration


  def change do
    create table(:resource_permissions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :organization_id, references(:organizations, type: :uuid, on_delete: :delete_all)
      add :organization_name, :string, size: 32
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :tag, :string, size: 16
      add :resource_id, references(:resources, type: :uuid, on_delete: :delete_all)
      add :permission_id, references(:permissions, type: :uuid, on_delete: :delete_all)
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps(type: :timestamptz)
  end

    create index(:resource_permissions, [:organization_id])
    create index(:resource_permissions, [:resource_id])
    create index(:resource_permissions, [:permission_id])
    create index(:resource_permissions, [:created_by_id])
    create index(:resource_permissions, [:updated_by_id])

  end
end
