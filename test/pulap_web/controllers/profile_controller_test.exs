defmodule PulapWeb.ProfileControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth

  @create_attrs %{anniversary_date: "2010-04-17 14:00:00.000000Z", annotations: "some annotations", avatar: "some avatar", avatar_path: "some avatar_path", bio: "some bio", cards: "some cards", description: "some description", email: "some email", geolocation: 120.5, header: "some header", header_path: "some header_path", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, moto: "some moto", name: "some name", started_at: "2010-04-17 14:00:00.000000Z", website: "some website"}
  @update_attrs %{anniversary_date: "2011-05-18 15:01:01.000000Z", annotations: "some updated annotations", avatar: "some updated avatar", avatar_path: "some updated avatar_path", bio: "some updated bio", cards: "some updated cards", description: "some updated description", email: "some updated email", geolocation: 456.7, header: "some updated header", header_path: "some updated header_path", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, moto: "some updated moto", name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z", website: "some updated website"}
  @invalid_attrs %{anniversary_date: nil, annotations: nil, avatar: nil, avatar_path: nil, bio: nil, cards: nil, description: nil, email: nil, geolocation: nil, header: nil, header_path: nil, id: nil, is_active: nil, is_logical_deleted: nil, moto: nil, name: nil, started_at: nil, website: nil}

  def fixture(:profile) do
    {:ok, profile} = Auth.create_profile(@create_attrs)
    profile
  end

  describe "index" do
    test "lists all profiles", %{conn: conn} do
      conn = get conn, profile_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Profiles"
    end
  end

  describe "new profile" do
    test "renders form", %{conn: conn} do
      conn = get conn, profile_path(conn, :new)
      assert html_response(conn, 200) =~ "New Profile"
    end
  end

  describe "create profile" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, profile_path(conn, :create), profile: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == profile_path(conn, :show, id)

      conn = get conn, profile_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Profile"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, profile_path(conn, :create), profile: @invalid_attrs
      assert html_response(conn, 200) =~ "New Profile"
    end
  end

  describe "edit profile" do
    setup [:create_profile]

    test "renders form for editing chosen profile", %{conn: conn, profile: profile} do
      conn = get conn, profile_path(conn, :edit, profile)
      assert html_response(conn, 200) =~ "Edit Profile"
    end
  end

  describe "update profile" do
    setup [:create_profile]

    test "redirects when data is valid", %{conn: conn, profile: profile} do
      conn = put conn, profile_path(conn, :update, profile), profile: @update_attrs
      assert redirected_to(conn) == profile_path(conn, :show, profile)

      conn = get conn, profile_path(conn, :show, profile)
      assert html_response(conn, 200) =~ "some updated annotations"
    end

    test "renders errors when data is invalid", %{conn: conn, profile: profile} do
      conn = put conn, profile_path(conn, :update, profile), profile: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Profile"
    end
  end

  describe "delete profile" do
    setup [:create_profile]

    test "deletes chosen profile", %{conn: conn, profile: profile} do
      conn = delete conn, profile_path(conn, :delete, profile)
      assert redirected_to(conn) == profile_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, profile_path(conn, :show, profile)
      end
    end
  end

  defp create_profile(_) do
    profile = fixture(:profile)
    {:ok, profile: profile}
  end
end
