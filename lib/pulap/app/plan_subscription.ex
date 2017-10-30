defmodule Pulap.App.PlanSubscription do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.App.PlanSubscription


  schema "plans_subscriptions" do
    field :description, :string
    field :ends_at, :utc_datetime
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :started_at, :utc_datetime
    field :organization_id, :id
    field :user_id, :id
    field :plan_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%PlanSubscription{} = plan_subscription, attrs) do
    plan_subscription
    |> cast(attrs, [:name, :description, :started_at, :ends_at, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :started_at, :ends_at, :is_active, :is_logical_deleted])
  end
end
