defmodule Pulap.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :started_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :organization_id, references(:organizations, type: :uuid, on_delete: :delete_all)
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:plans, [:organization_id, :name])
    create index(:plans, [:created_by_id])
    create index(:plans, [:updated_by_id])
  end
end
