defmodule Pulap.Repo.Migrations.CreateOrganizations do
  use Ecto.Migration


  def up do
    create table(:organizations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :owner_username, :string, size: 32, null: false
      add :owner_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :card, :json
      add :annotations, :string
    end

    execute("SELECT AddGeometryColumn ('organizations', 'geolocation', 4326, 'POINT', 2);")

    alter table(:organizations) do
      add :started_at, :timestamptz
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :created_by_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps(type: :timestamptz)
    end

    create unique_index(:organizations, [:name])
    create index(:organizations, [:created_by_id])
    create index(:organizations, [:updated_by_id])

  end

  def down do
    drop table("organizations")
  end
end
