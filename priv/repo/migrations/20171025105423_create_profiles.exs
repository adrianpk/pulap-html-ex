defmodule Pulap.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def up do
    create table(:profiles) do
      add :name, :string, size: 32
      add :email, :string, size: 255
      add :description, :string, size: 255
      add :bio, :string, size: 255
      add :moto, :string, size: 255
      add :website, :string, size: 255
      add :anniversary_date, :utc_datetime
      add :avatar_path, :string, size: 255
      add :avatar, :binary
      add :header_path, :string, size: 255
      add :header, :binary
      add :cards, :string, size: 255
      add :annotations, :json
    end

    execute("SELECT AddGeometryColumn ('profiles','geolocation', 4326, 'POINT', 2);")

    alter table(:profiles) do
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :started_at, :utc_datetime
      add :created_by, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:profiles, [:created_by])
  end

  def down do
    drop table("profiles")
  end
 end
