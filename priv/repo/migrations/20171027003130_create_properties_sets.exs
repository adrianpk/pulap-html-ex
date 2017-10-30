defmodule Pulap.Repo.Migrations.CreatePropertiesSet do
  use Ecto.Migration

  def change do
    create table(:properties_sets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :holder_id, :uuid
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:properties_sets, [:created_by_id])
    create index(:properties_sets, [:updated_by_id])

  end
end
