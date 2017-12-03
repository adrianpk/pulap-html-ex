defmodule Pulap.Repo.Migrations.CreatePlanSubscriptions do
  use Ecto.Migration

  def change do
    create table(:plan_subscriptions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :description, :string
      add :started_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :organization_id, references(:organizations, type: :uuid, on_delete: :nothing)
      add :user_id, references(:users, type: :uuid, on_delete: :nothing)
      add :plan_id, references(:plans, type: :uuid, on_delete: :nothing)
      add :created_by_id, references(:plan_subscriptions, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:plan_subscriptions, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    # create index(:plan_subscriptions, [:organization_id])
    create index(:plan_subscriptions, [:organization_id, :user_id, :plan_id])
    # create index(:plan_subscriptions, [:plan_id])
    create index(:plan_subscriptions, [:created_by_id])
    create index(:plan_subscriptions, [:updated_by_id])
  end
end
