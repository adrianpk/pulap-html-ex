defmodule Pulap.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :password, :string
      add :password_hash, :string
      add :email, :string
      add :given_name, :string
      add :middle_names, :string
      add :family_name, :string
      add :card, :jsonb
      add :annotations, :jsonb
      # add :geolocation, :geometry
      add :started_at, :timestamptz
      add :created_by, :uuid
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false

      timestamps(type: :timestamptz)
    end

    execute("SELECT AddGeometryColumn ('users','geolocation',4326,'POINT',2);")
  end

  def down do
    drop table("users")
  end
end

