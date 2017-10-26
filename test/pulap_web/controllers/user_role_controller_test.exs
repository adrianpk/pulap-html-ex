defmodule PulapWeb.UserRoleControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:user_role) do
    {:ok, user_role} = Auth.create_user_role(@create_attrs)
    user_role
  end

  describe "index" do
    test "lists all user_roles", %{conn: conn} do
      conn = get conn, user_role_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing User roles"
    end
  end

  describe "new user_role" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_role_path(conn, :new)
      assert html_response(conn, 200) =~ "New User role"
    end
  end

  describe "create user_role" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, user_role_path(conn, :create), user_role: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == user_role_path(conn, :show, id)

      conn = get conn, user_role_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show User role"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_role_path(conn, :create), user_role: @invalid_attrs
      assert html_response(conn, 200) =~ "New User role"
    end
  end

  describe "edit user_role" do
    setup [:create_user_role]

    test "renders form for editing chosen user_role", %{conn: conn, user_role: user_role} do
      conn = get conn, user_role_path(conn, :edit, user_role)
      assert html_response(conn, 200) =~ "Edit User role"
    end
  end

  describe "update user_role" do
    setup [:create_user_role]

    test "redirects when data is valid", %{conn: conn, user_role: user_role} do
      conn = put conn, user_role_path(conn, :update, user_role), user_role: @update_attrs
      assert redirected_to(conn) == user_role_path(conn, :show, user_role)

      conn = get conn, user_role_path(conn, :show, user_role)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, user_role: user_role} do
      conn = put conn, user_role_path(conn, :update, user_role), user_role: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit User role"
    end
  end

  describe "delete user_role" do
    setup [:create_user_role]

    test "deletes chosen user_role", %{conn: conn, user_role: user_role} do
      conn = delete conn, user_role_path(conn, :delete, user_role)
      assert redirected_to(conn) == user_role_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, user_role_path(conn, :show, user_role)
      end
    end
  end

  defp create_user_role(_) do
    user_role = fixture(:user_role)
    {:ok, user_role: user_role}
  end
end
