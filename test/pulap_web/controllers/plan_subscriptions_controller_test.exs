defmodule PulapWeb.PlanSubscriptionsControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App

  @create_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:plan_subscriptions) do
    {:ok, plan_subscriptions} = App.create_plan_subscriptions(@create_attrs)
    plan_subscriptions
  end

  describe "index" do
    test "lists all plans_subscriptions", %{conn: conn} do
      conn = get conn, plan_subscriptions_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Plans subscriptions"
    end
  end

  describe "new plan_subscriptions" do
    test "renders form", %{conn: conn} do
      conn = get conn, plan_subscriptions_path(conn, :new)
      assert html_response(conn, 200) =~ "New Plan subscriptions"
    end
  end

  describe "create plan_subscriptions" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, plan_subscriptions_path(conn, :create), plan_subscriptions: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == plan_subscriptions_path(conn, :show, id)

      conn = get conn, plan_subscriptions_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Plan subscriptions"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, plan_subscriptions_path(conn, :create), plan_subscriptions: @invalid_attrs
      assert html_response(conn, 200) =~ "New Plan subscriptions"
    end
  end

  describe "edit plan_subscriptions" do
    setup [:create_plan_subscriptions]

    test "renders form for editing chosen plan_subscriptions", %{conn: conn, plan_subscriptions: plan_subscriptions} do
      conn = get conn, plan_subscriptions_path(conn, :edit, plan_subscriptions)
      assert html_response(conn, 200) =~ "Edit Plan subscriptions"
    end
  end

  describe "update plan_subscriptions" do
    setup [:create_plan_subscriptions]

    test "redirects when data is valid", %{conn: conn, plan_subscriptions: plan_subscriptions} do
      conn = put conn, plan_subscriptions_path(conn, :update, plan_subscriptions), plan_subscriptions: @update_attrs
      assert redirected_to(conn) == plan_subscriptions_path(conn, :show, plan_subscriptions)

      conn = get conn, plan_subscriptions_path(conn, :show, plan_subscriptions)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, plan_subscriptions: plan_subscriptions} do
      conn = put conn, plan_subscriptions_path(conn, :update, plan_subscriptions), plan_subscriptions: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Plan subscriptions"
    end
  end

  describe "delete plan_subscriptions" do
    setup [:create_plan_subscriptions]

    test "deletes chosen plan_subscriptions", %{conn: conn, plan_subscriptions: plan_subscriptions} do
      conn = delete conn, plan_subscriptions_path(conn, :delete, plan_subscriptions)
      assert redirected_to(conn) == plan_subscriptions_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, plan_subscriptions_path(conn, :show, plan_subscriptions)
      end
    end
  end

  defp create_plan_subscriptions(_) do
    plan_subscriptions = fixture(:plan_subscriptions)
    {:ok, plan_subscriptions: plan_subscriptions}
  end
end
