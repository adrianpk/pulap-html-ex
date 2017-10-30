defmodule PulapWeb.PlanSubscriptionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App

  @create_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:plan_subscription) do
    {:ok, plan_subscription} = App.create_plan_subscription(@create_attrs)
    plan_subscription
  end

  describe "index" do
    test "lists all plans_subscriptions", %{conn: conn} do
      conn = get conn, plan_subscription_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Plans subscriptions"
    end
  end

  describe "new plan_subscription" do
    test "renders form", %{conn: conn} do
      conn = get conn, plan_subscription_path(conn, :new)
      assert html_response(conn, 200) =~ "New Plan subscription"
    end
  end

  describe "create plan_subscription" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, plan_subscription_path(conn, :create), plan_subscription: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == plan_subscription_path(conn, :show, id)

      conn = get conn, plan_subscription_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Plan subscription"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, plan_subscription_path(conn, :create), plan_subscription: @invalid_attrs
      assert html_response(conn, 200) =~ "New Plan subscription"
    end
  end

  describe "edit plan_subscription" do
    setup [:create_plan_subscription]

    test "renders form for editing chosen plan_subscription", %{conn: conn, plan_subscription: plan_subscription} do
      conn = get conn, plan_subscription_path(conn, :edit, plan_subscription)
      assert html_response(conn, 200) =~ "Edit Plan subscription"
    end
  end

  describe "update plan_subscription" do
    setup [:create_plan_subscription]

    test "redirects when data is valid", %{conn: conn, plan_subscription: plan_subscription} do
      conn = put conn, plan_subscription_path(conn, :update, plan_subscription), plan_subscription: @update_attrs
      assert redirected_to(conn) == plan_subscription_path(conn, :show, plan_subscription)

      conn = get conn, plan_subscription_path(conn, :show, plan_subscription)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, plan_subscription: plan_subscription} do
      conn = put conn, plan_subscription_path(conn, :update, plan_subscription), plan_subscription: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Plan subscription"
    end
  end

  describe "delete plan_subscription" do
    setup [:create_plan_subscription]

    test "deletes chosen plan_subscription", %{conn: conn, plan_subscription: plan_subscription} do
      conn = delete conn, plan_subscription_path(conn, :delete, plan_subscription)
      assert redirected_to(conn) == plan_subscription_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, plan_subscription_path(conn, :show, plan_subscription)
      end
    end
  end

  defp create_plan_subscription(_) do
    plan_subscription = fixture(:plan_subscription)
    {:ok, plan_subscription: plan_subscription}
  end
end
