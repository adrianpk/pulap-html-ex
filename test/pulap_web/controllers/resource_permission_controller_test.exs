defmodule PulapWeb.ResourcePermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:resource_permission) do
    {:ok, resource_permission} = Auth.create_resource_permission(@create_attrs)
    resource_permission
  end

  describe "index" do
    test "lists all resource_permissions", %{conn: conn} do
      conn = get conn, resource_permission_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Resource permissions"
    end
  end

  describe "new resource_permission" do
    test "renders form", %{conn: conn} do
      conn = get conn, resource_permission_path(conn, :new)
      assert html_response(conn, 200) =~ "New Resource permission"
    end
  end

  describe "create resource_permission" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, resource_permission_path(conn, :create), resource_permission: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == resource_permission_path(conn, :show, id)

      conn = get conn, resource_permission_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Resource permission"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, resource_permission_path(conn, :create), resource_permission: @invalid_attrs
      assert html_response(conn, 200) =~ "New Resource permission"
    end
  end

  describe "edit resource_permission" do
    setup [:create_resource_permission]

    test "renders form for editing chosen resource_permission", %{conn: conn, resource_permission: resource_permission} do
      conn = get conn, resource_permission_path(conn, :edit, resource_permission)
      assert html_response(conn, 200) =~ "Edit Resource permission"
    end
  end

  describe "update resource_permission" do
    setup [:create_resource_permission]

    test "redirects when data is valid", %{conn: conn, resource_permission: resource_permission} do
      conn = put conn, resource_permission_path(conn, :update, resource_permission), resource_permission: @update_attrs
      assert redirected_to(conn) == resource_permission_path(conn, :show, resource_permission)

      conn = get conn, resource_permission_path(conn, :show, resource_permission)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, resource_permission: resource_permission} do
      conn = put conn, resource_permission_path(conn, :update, resource_permission), resource_permission: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Resource permission"
    end
  end

  describe "delete resource_permission" do
    setup [:create_resource_permission]

    test "deletes chosen resource_permission", %{conn: conn, resource_permission: resource_permission} do
      conn = delete conn, resource_permission_path(conn, :delete, resource_permission)
      assert redirected_to(conn) == resource_permission_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, resource_permission_path(conn, :show, resource_permission)
      end
    end
  end

  defp create_resource_permission(_) do
    resource_permission = fixture(:resource_permission)
    {:ok, resource_permission: resource_permission}
  end
end
