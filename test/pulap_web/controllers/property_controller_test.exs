defmodule PulapWeb.PropertyControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App

  @create_attrs %{boolean: true, date: ~D[2010-04-17], datetime: ~N[2010-04-17 14:00:00.000000], decimal: "120.5", description: "some description", float: 120.5, geolocation: 120.5, id: "7488a646-e31f-11e4-aace-600308960662", integer: 42, is_active: true, is_logical_deleted: true, name: "some name", property_set_name: "some property_set_name", property_data_type: "some property_data_type", string: "some string", time: ~T[14:00:00.000000], uuid: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{boolean: false, date: ~D[2011-05-18], datetime: ~N[2011-05-18 15:01:01.000000], decimal: "456.7", description: "some updated description", float: 456.7, geolocation: 456.7, id: "7488a646-e31f-11e4-aace-600308960668", integer: 43, is_active: false, is_logical_deleted: false, name: "some updated name", property_set_name: "some updated property_set_name", property_data_type: "some updated property_data_type", string: "some updated string", time: ~T[15:01:01.000000], uuid: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{boolean: nil, date: nil, datetime: nil, decimal: nil, description: nil, float: nil, geolocation: nil, id: nil, integer: nil, is_active: nil, is_logical_deleted: nil, name: nil, property_set_name: nil, property_data_type: nil, string: nil, time: nil, uuid: nil}

  def fixture(:property) do
    {:ok, property} = App.create_property(@create_attrs)
    property
  end

  describe "index" do
    test "lists all properties", %{conn: conn} do
      conn = get conn, property_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Properties"
    end
  end

  describe "new property" do
    test "renders form", %{conn: conn} do
      conn = get conn, property_path(conn, :new)
      assert html_response(conn, 200) =~ "New Property"
    end
  end

  describe "create property" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, property_path(conn, :create), property: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == property_path(conn, :show, id)

      conn = get conn, property_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Property"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, property_path(conn, :create), property: @invalid_attrs
      assert html_response(conn, 200) =~ "New Property"
    end
  end

  describe "edit property" do
    setup [:create_property]

    test "renders form for editing chosen property", %{conn: conn, property: property} do
      conn = get conn, property_path(conn, :edit, property)
      assert html_response(conn, 200) =~ "Edit Property"
    end
  end

  describe "update property" do
    setup [:create_property]

    test "redirects when data is valid", %{conn: conn, property: property} do
      conn = put conn, property_path(conn, :update, property), property: @update_attrs
      assert redirected_to(conn) == property_path(conn, :show, property)

      conn = get conn, property_path(conn, :show, property)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, property: property} do
      conn = put conn, property_path(conn, :update, property), property: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Property"
    end
  end

  describe "delete property" do
    setup [:create_property]

    test "deletes chosen property", %{conn: conn, property: property} do
      conn = delete conn, property_path(conn, :delete, property)
      assert redirected_to(conn) == property_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, property_path(conn, :show, property)
      end
    end
  end

  defp create_property(_) do
    property = fixture(:property)
    {:ok, property: property}
  end
end
