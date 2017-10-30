defmodule PulapWeb.KeyValueControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App

  @create_attrs %{is_active: true, is_logical_deleted: true, key: "some key", key_group: "some key_group", key_subgroup: "some key_subgroup", locale: "some locale", position: 42, set: "some set", value: "some value"}
  @update_attrs %{is_active: false, is_logical_deleted: false, key: "some updated key", key_group: "some updated key_group", key_subgroup: "some updated key_subgroup", locale: "some updated locale", position: 43, set: "some updated set", value: "some updated value"}
  @invalid_attrs %{is_active: nil, is_logical_deleted: nil, key: nil, key_group: nil, key_subgroup: nil, locale: nil, position: nil, set: nil, value: nil}

  def fixture(:key_value) do
    {:ok, key_value} = App.create_key_value(@create_attrs)
    key_value
  end

  describe "index" do
    test "lists all keyvalues", %{conn: conn} do
      conn = get conn, key_value_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Keyvalues"
    end
  end

  describe "new key_value" do
    test "renders form", %{conn: conn} do
      conn = get conn, key_value_path(conn, :new)
      assert html_response(conn, 200) =~ "New Key value"
    end
  end

  describe "create key_value" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, key_value_path(conn, :create), key_value: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == key_value_path(conn, :show, id)

      conn = get conn, key_value_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Key value"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, key_value_path(conn, :create), key_value: @invalid_attrs
      assert html_response(conn, 200) =~ "New Key value"
    end
  end

  describe "edit key_value" do
    setup [:create_key_value]

    test "renders form for editing chosen key_value", %{conn: conn, key_value: key_value} do
      conn = get conn, key_value_path(conn, :edit, key_value)
      assert html_response(conn, 200) =~ "Edit Key value"
    end
  end

  describe "update key_value" do
    setup [:create_key_value]

    test "redirects when data is valid", %{conn: conn, key_value: key_value} do
      conn = put conn, key_value_path(conn, :update, key_value), key_value: @update_attrs
      assert redirected_to(conn) == key_value_path(conn, :show, key_value)

      conn = get conn, key_value_path(conn, :show, key_value)
      assert html_response(conn, 200) =~ "some updated key"
    end

    test "renders errors when data is invalid", %{conn: conn, key_value: key_value} do
      conn = put conn, key_value_path(conn, :update, key_value), key_value: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Key value"
    end
  end

  describe "delete key_value" do
    setup [:create_key_value]

    test "deletes chosen key_value", %{conn: conn, key_value: key_value} do
      conn = delete conn, key_value_path(conn, :delete, key_value)
      assert redirected_to(conn) == key_value_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, key_value_path(conn, :show, key_value)
      end
    end
  end

  defp create_key_value(_) do
    key_value = fixture(:key_value)
    {:ok, key_value: key_value}
  end
end
