defmodule Pulap.Repo.Migrations.CreatePlansSubscriptions do
  use Ecto.Migration

  def change do
    create table(:plans_subscriptions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :started_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :organization_id, references(:organizations, type: :binary_id, on_delete: :nothing)
      add :user_id, references(:users, type: :binary_id, on_delete: :nothing)
      add :plan_id, references(:plans, type: :binary_id, on_delete: :nothing)
      add :created_by_id, references(:plans_subscriptions, type: :binary_id, on_delete: :nothing)
      add :updated_by_id, references(:plans_subscriptions, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    # create index(:plans_subscriptions, [:organization_id])
    create index(:plans_subscriptions, [:organization_id, :user_id, :plan_id])
    # create index(:plans_subscriptions, [:plan_id])
    create index(:plans_subscriptions, [:created_by_id])
    create index(:plans_subscriptions, [:updated_by_id])
  end
end
