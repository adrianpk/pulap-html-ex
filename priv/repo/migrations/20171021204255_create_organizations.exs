defmodule Pulap.Repo.Migrations.CreateOrganizations do
  use Ecto.Migration


  def up do
    create table(:organizations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, size: 32, null: false
      add :description, :string, size: 255
      add :card, :json
      add :annotations, :string
      add :owner_username, :string, size: 32, null: false
      add :owner_id, references(:users, type: :binary_id, on_delete: :nothing)
    end

    execute("SELECT AddGeometryColumn ('organizations','geolocation',4326,'POINT',2);")

    alter table(:organizations) do
      add :created_by, :binary_id, null: false
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :utc_datetime

      timestamps(type: :timestamptz)
    end
    create unique_index(:organizations, [:name])

  end

 
  def down do
    drop table("organizations")
  end
end
