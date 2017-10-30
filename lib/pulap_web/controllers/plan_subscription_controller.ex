defmodule PulapWeb.PlanSubscriptionController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.PlanSubscription

  def index(conn, _params) do
    plans_subscriptions = App.list_plans_subscriptions()
    render(conn, "index.html", plans_subscriptions: plans_subscriptions)
  end

  def new(conn, _params) do
    changeset = App.change_plan_subscription(%PlanSubscription{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plan_subscription" => plan_subscription_params}) do
    case App.create_plan_subscription(plan_subscription_params) do
      {:ok, plan_subscription} ->
        conn
        |> put_flash(:info, "Plan subscription created successfully.")
        |> redirect(to: plan_subscription_path(conn, :show, plan_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan_subscription = App.get_plan_subscription!(id)
    render(conn, "show.html", plan_subscription: plan_subscription)
  end

  def edit(conn, %{"id" => id}) do
    plan_subscription = App.get_plan_subscription!(id)
    changeset = App.change_plan_subscription(plan_subscription)
    render(conn, "edit.html", plan_subscription: plan_subscription, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan_subscription" => plan_subscription_params}) do
    plan_subscription = App.get_plan_subscription!(id)

    case App.update_plan_subscription(plan_subscription, plan_subscription_params) do
      {:ok, plan_subscription} ->
        conn
        |> put_flash(:info, "Plan subscription updated successfully.")
        |> redirect(to: plan_subscription_path(conn, :show, plan_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plan_subscription: plan_subscription, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan_subscription = App.get_plan_subscription!(id)
    {:ok, _plan_subscription} = App.delete_plan_subscription(plan_subscription)

    conn
    |> put_flash(:info, "Plan subscription deleted successfully.")
    |> redirect(to: plan_subscription_path(conn, :index))
  end
end
