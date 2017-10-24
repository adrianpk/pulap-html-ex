defmodule PulapWeb.PermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil, started_at: nil}

  def fixture(:permission) do
    {:ok, permission} = Auth.create_permission(@create_attrs)
    permission
  end

  describe "index" do
    test "lists all permissions", %{conn: conn} do
      conn = get conn, permission_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Permissions"
    end
  end

  describe "new permission" do
    test "renders form", %{conn: conn} do
      conn = get conn, permission_path(conn, :new)
      assert html_response(conn, 200) =~ "New Permission"
    end
  end

  describe "create permission" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, permission_path(conn, :create), permission: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == permission_path(conn, :show, id)

      conn = get conn, permission_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Permission"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, permission_path(conn, :create), permission: @invalid_attrs
      assert html_response(conn, 200) =~ "New Permission"
    end
  end

  describe "edit permission" do
    setup [:create_permission]

    test "renders form for editing chosen permission", %{conn: conn, permission: permission} do
      conn = get conn, permission_path(conn, :edit, permission)
      assert html_response(conn, 200) =~ "Edit Permission"
    end
  end

  describe "update permission" do
    setup [:create_permission]

    test "redirects when data is valid", %{conn: conn, permission: permission} do
      conn = put conn, permission_path(conn, :update, permission), permission: @update_attrs
      assert redirected_to(conn) == permission_path(conn, :show, permission)

      conn = get conn, permission_path(conn, :show, permission)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, permission: permission} do
      conn = put conn, permission_path(conn, :update, permission), permission: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Permission"
    end
  end

  describe "delete permission" do
    setup [:create_permission]

    test "deletes chosen permission", %{conn: conn, permission: permission} do
      conn = delete conn, permission_path(conn, :delete, permission)
      assert redirected_to(conn) == permission_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, permission_path(conn, :show, permission)
      end
    end
  end

  defp create_permission(_) do
    permission = fixture(:permission)
    {:ok, permission: permission}
  end
end
