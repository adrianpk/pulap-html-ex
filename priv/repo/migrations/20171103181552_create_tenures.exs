defmodule Pulap.Repo.Migrations.CreateTenures do
  use Ecto.Migration

  def change do
    create table(:tenures) do
      add :job_title, :string, size: 32
      add :job_description, :text
      add :started_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :user_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:tenures, [:organization_id])
    create index(:tenures, [:user_id])
    create index(:tenures, [:created_by_id])
    create index(:tenures, [:updated_by_id])
  end
end
