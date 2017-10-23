defmodule Pulap.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string, size: 32, null: false
      add :password_hash, :string, size: 128, null: false
      add :email, :string, size: 255, null: false
      add :given_name, :string, size: 32
      add :middle_names, :string, size: 32
      add :family_name, :string, size: 64
      add :card, :json
      add :annotations, :jsonb
    end

    execute("SELECT AddGeometryColumn ('users','geolocation',4326,'POINT',2);")

    alter table(:users) do
      add :created_by, :binary_id
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :timestamptz

      timestamps(type: :timestamptz)
    end
    create unique_index(:users, [:username, :email])

  end

  def down do
    drop table("users")
  end
end