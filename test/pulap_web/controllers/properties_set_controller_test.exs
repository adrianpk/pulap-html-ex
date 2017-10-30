defmodule PulapWeb.PropertiesSetControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App

  @create_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:properties_set) do
    {:ok, properties_set} = App.create_properties_set(@create_attrs)
    properties_set
  end

  describe "index" do
    test "lists all property_sets", %{conn: conn} do
      conn = get conn, properties_set_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Properties sets"
    end
  end

  describe "new properties_set" do
    test "renders form", %{conn: conn} do
      conn = get conn, properties_set_path(conn, :new)
      assert html_response(conn, 200) =~ "New Properties set"
    end
  end

  describe "create properties_set" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, properties_set_path(conn, :create), properties_set: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == properties_set_path(conn, :show, id)

      conn = get conn, properties_set_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Properties set"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, properties_set_path(conn, :create), properties_set: @invalid_attrs
      assert html_response(conn, 200) =~ "New Properties set"
    end
  end

  describe "edit properties_set" do
    setup [:create_properties_set]

    test "renders form for editing chosen properties_set", %{conn: conn, properties_set: properties_set} do
      conn = get conn, properties_set_path(conn, :edit, properties_set)
      assert html_response(conn, 200) =~ "Edit Properties set"
    end
  end

  describe "update properties_set" do
    setup [:create_properties_set]

    test "redirects when data is valid", %{conn: conn, properties_set: properties_set} do
      conn = put conn, properties_set_path(conn, :update, properties_set), properties_set: @update_attrs
      assert redirected_to(conn) == properties_set_path(conn, :show, properties_set)

      conn = get conn, properties_set_path(conn, :show, properties_set)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, properties_set: properties_set} do
      conn = put conn, properties_set_path(conn, :update, properties_set), properties_set: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Properties set"
    end
  end

  describe "delete properties_set" do
    setup [:create_properties_set]

    test "deletes chosen properties_set", %{conn: conn, properties_set: properties_set} do
      conn = delete conn, properties_set_path(conn, :delete, properties_set)
      assert redirected_to(conn) == properties_set_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, properties_set_path(conn, :show, properties_set)
      end
    end
  end

  defp create_properties_set(_) do
    properties_set = fixture(:properties_set)
    {:ok, properties_set: properties_set}
  end
end
