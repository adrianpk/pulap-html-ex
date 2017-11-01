defmodule PulapWeb.GeoAreaControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Geo

  @create_attrs %{alt_name: "some alt_name", canonical_name: "some canonical_name", cards: "some cards", dialing_code: "some dialing_code", geolocation: 120.5, is_active: true, is_logical_deleted: true, is_main: true, locale: "some locale", locale_canonical_name: "some locale_canonical_name", locale_name: "some locale_name", name: "some name", position: 42, zip_code: "some zip_code"}
  @update_attrs %{alt_name: "some updated alt_name", canonical_name: "some updated canonical_name", cards: "some updated cards", dialing_code: "some updated dialing_code", geolocation: 456.7, is_active: false, is_logical_deleted: false, is_main: false, locale: "some updated locale", locale_canonical_name: "some updated locale_canonical_name", locale_name: "some updated locale_name", name: "some updated name", position: 43, zip_code: "some updated zip_code"}
  @invalid_attrs %{alt_name: nil, canonical_name: nil, cards: nil, dialing_code: nil, geolocation: nil, is_active: nil, is_logical_deleted: nil, is_main: nil, locale: nil, locale_canonical_name: nil, locale_name: nil, name: nil, position: nil, zip_code: nil}

  def fixture(:geo_area) do
    {:ok, geo_area} = Geo.create_geo_area(@create_attrs)
    geo_area
  end

  describe "index" do
    test "lists all geo_areas", %{conn: conn} do
      conn = get conn, geo_area_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Geo areas"
    end
  end

  describe "new geo_area" do
    test "renders form", %{conn: conn} do
      conn = get conn, geo_area_path(conn, :new)
      assert html_response(conn, 200) =~ "New Geo area"
    end
  end

  describe "create geo_area" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, geo_area_path(conn, :create), geo_area: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == geo_area_path(conn, :show, id)

      conn = get conn, geo_area_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Geo area"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, geo_area_path(conn, :create), geo_area: @invalid_attrs
      assert html_response(conn, 200) =~ "New Geo area"
    end
  end

  describe "edit geo_area" do
    setup [:create_geo_area]

    test "renders form for editing chosen geo_area", %{conn: conn, geo_area: geo_area} do
      conn = get conn, geo_area_path(conn, :edit, geo_area)
      assert html_response(conn, 200) =~ "Edit Geo area"
    end
  end

  describe "update geo_area" do
    setup [:create_geo_area]

    test "redirects when data is valid", %{conn: conn, geo_area: geo_area} do
      conn = put conn, geo_area_path(conn, :update, geo_area), geo_area: @update_attrs
      assert redirected_to(conn) == geo_area_path(conn, :show, geo_area)

      conn = get conn, geo_area_path(conn, :show, geo_area)
      assert html_response(conn, 200) =~ "some updated alt_name"
    end

    test "renders errors when data is invalid", %{conn: conn, geo_area: geo_area} do
      conn = put conn, geo_area_path(conn, :update, geo_area), geo_area: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Geo area"
    end
  end

  describe "delete geo_area" do
    setup [:create_geo_area]

    test "deletes chosen geo_area", %{conn: conn, geo_area: geo_area} do
      conn = delete conn, geo_area_path(conn, :delete, geo_area)
      assert redirected_to(conn) == geo_area_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, geo_area_path(conn, :show, geo_area)
      end
    end
  end

  defp create_geo_area(_) do
    geo_area = fixture(:geo_area)
    {:ok, geo_area: geo_area}
  end
end
