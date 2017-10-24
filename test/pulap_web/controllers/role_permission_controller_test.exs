defmodule PulapWeb.RolePermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:role_permission) do
    {:ok, role_permission} = Auth.create_role_permission(@create_attrs)
    role_permission
  end

  describe "index" do
    test "lists all role_permissions", %{conn: conn} do
      conn = get conn, role_permission_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Role permissions"
    end
  end

  describe "new role_permission" do
    test "renders form", %{conn: conn} do
      conn = get conn, role_permission_path(conn, :new)
      assert html_response(conn, 200) =~ "New Role permission"
    end
  end

  describe "create role_permission" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, role_permission_path(conn, :create), role_permission: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == role_permission_path(conn, :show, id)

      conn = get conn, role_permission_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Role permission"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, role_permission_path(conn, :create), role_permission: @invalid_attrs
      assert html_response(conn, 200) =~ "New Role permission"
    end
  end

  describe "edit role_permission" do
    setup [:create_role_permission]

    test "renders form for editing chosen role_permission", %{conn: conn, role_permission: role_permission} do
      conn = get conn, role_permission_path(conn, :edit, role_permission)
      assert html_response(conn, 200) =~ "Edit Role permission"
    end
  end

  describe "update role_permission" do
    setup [:create_role_permission]

    test "redirects when data is valid", %{conn: conn, role_permission: role_permission} do
      conn = put conn, role_permission_path(conn, :update, role_permission), role_permission: @update_attrs
      assert redirected_to(conn) == role_permission_path(conn, :show, role_permission)

      conn = get conn, role_permission_path(conn, :show, role_permission)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, role_permission: role_permission} do
      conn = put conn, role_permission_path(conn, :update, role_permission), role_permission: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Role permission"
    end
  end

  describe "delete role_permission" do
    setup [:create_role_permission]

    test "deletes chosen role_permission", %{conn: conn, role_permission: role_permission} do
      conn = delete conn, role_permission_path(conn, :delete, role_permission)
      assert redirected_to(conn) == role_permission_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, role_permission_path(conn, :show, role_permission)
      end
    end
  end

  defp create_role_permission(_) do
    role_permission = fixture(:role_permission)
    {:ok, role_permission: role_permission}
  end
end
