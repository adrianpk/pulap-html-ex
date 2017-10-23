defmodule PulapWeb.RoleControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:role) do
    {:ok, role} = Auth.create_role(@create_attrs)
    role
  end

  describe "index" do
    test "lists all roles", %{conn: conn} do
      conn = get conn, role_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Roles"
    end
  end

  describe "new role" do
    test "renders form", %{conn: conn} do
      conn = get conn, role_path(conn, :new)
      assert html_response(conn, 200) =~ "New Role"
    end
  end

  describe "create role" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, role_path(conn, :create), role: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == role_path(conn, :show, id)

      conn = get conn, role_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Role"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, role_path(conn, :create), role: @invalid_attrs
      assert html_response(conn, 200) =~ "New Role"
    end
  end

  describe "edit role" do
    setup [:create_role]

    test "renders form for editing chosen role", %{conn: conn, role: role} do
      conn = get conn, role_path(conn, :edit, role)
      assert html_response(conn, 200) =~ "Edit Role"
    end
  end

  describe "update role" do
    setup [:create_role]

    test "redirects when data is valid", %{conn: conn, role: role} do
      conn = put conn, role_path(conn, :update, role), role: @update_attrs
      assert redirected_to(conn) == role_path(conn, :show, role)

      conn = get conn, role_path(conn, :show, role)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, role: role} do
      conn = put conn, role_path(conn, :update, role), role: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Role"
    end
  end

  describe "delete role" do
    setup [:create_role]

    test "deletes chosen role", %{conn: conn, role: role} do
      conn = delete conn, role_path(conn, :delete, role)
      assert redirected_to(conn) == role_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, role_path(conn, :show, role)
      end
    end
  end

  defp create_role(_) do
    role = fixture(:role)
    {:ok, role: role}
  end
end
