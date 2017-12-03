defmodule Pulap.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def up do
    create table(:profiles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all)
      add :organization_id, references(:organizations, type: :uuid, on_delete: :delete_all)
      add :property_set_name, :string
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
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:profiles, [:created_by_id])
    create index(:profiles, [:updated_by_id])

  end

  def down do
    drop table("profiles")
  end
 end
