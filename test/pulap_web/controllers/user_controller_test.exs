defmodule PulapWeb.UserControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{annotations: "some annotations", card: "some card", created_by: "7488a646-e31f-11e4-aace-600308960662", email: "some email", family_name: "some family_name", geolocation: 120.5, given_name: "some given_name", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, middle_names: "some middle_names", password: "some password", password_hash: "some password_hash", started_at: "2010-04-17 14:00:00.000000Z", username: "some username"}
  @update_attrs %{annotations: "some updated annotations", card: "some updated card", created_by: "7488a646-e31f-11e4-aace-600308960668", email: "some updated email", family_name: "some updated family_name", geolocation: 456.7, given_name: "some updated given_name", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, middle_names: "some updated middle_names", password: "some updated password", password_hash: "some updated password_hash", started_at: "2011-05-18 15:01:01.000000Z", username: "some updated username"}
  @invalid_attrs %{annotations: nil, card: nil, created_by: nil, email: nil, family_name: nil, geolocation: nil, given_name: nil, id: nil, is_active: nil, is_logical_deleted: nil, middle_names: nil, password: nil, password_hash: nil, started_at: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Auth.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == user_path(conn, :show, id)

      conn = get conn, user_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get conn, user_path(conn, :edit, user)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert redirected_to(conn) == user_path(conn, :show, user)

      conn = get conn, user_path(conn, :show, user)
      assert html_response(conn, 200) =~ "some updated annotations"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
      assert redirected_to(conn) == user_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, user_path(conn, :show, user)
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
