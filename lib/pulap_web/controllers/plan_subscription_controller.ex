defmodule PulapWeb.PlanSubscriptionController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.Biz.PlanSubscription

  def index(conn, _params) do
    plan_subscriptions = Biz.list_plan_subscriptions()
    render(conn, "index.html", plan_subscriptions: plan_subscriptions)
  end

  def new(conn, _params) do
    changeset = Biz.change_plan_subscription(%PlanSubscription{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plan_subscription" => plan_subscription_params}) do
    case Biz.create_plan_subscription(plan_subscription_params) do
      {:ok, plan_subscription} ->
        conn
        |> put_flash(:info, "Plan subscription created successfully.")
        |> redirect(to: plan_subscription_path(conn, :show, plan_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan_subscription = Biz.get_plan_subscription!(id)
    render(conn, "show.html", plan_subscription: plan_subscription)
  end

  def edit(conn, %{"id" => id}) do
    plan_subscription = Biz.get_plan_subscription!(id)
    changeset = Biz.change_plan_subscription(plan_subscription)
    render(conn, "edit.html", plan_subscription: plan_subscription, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan_subscription" => plan_subscription_params}) do
    plan_subscription = Biz.get_plan_subscription!(id)

    case Biz.update_plan_subscription(plan_subscription, plan_subscription_params) do
      {:ok, plan_subscription} ->
        conn
        |> put_flash(:info, "Plan subscription updated successfully.")
        |> redirect(to: plan_subscription_path(conn, :show, plan_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plan_subscription: plan_subscription, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan_subscription = Biz.get_plan_subscription!(id)
    {:ok, _plan_subscription} = Biz.delete_plan_subscription(plan_subscription)

    conn
    |> put_flash(:info, "Plan subscription deleted successfully.")
    |> redirect(to: plan_subscription_path(conn, :index))
  end
end
