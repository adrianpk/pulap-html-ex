defmodule PulapWeb.RealEstateControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Pulap

  @create_attrs %{room_height_cm: 42, price_per_square_meter: 120.5, type_of_building_val_loc: "some type_of_building_val_loc", geo_area_loc: "some geo_area_loc", geo_area_canonical: "some geo_area_canonical", property_type_val_en: "some property_type_val_en", terrace: true, geolocation: 120.5, heating_type_val_loc: "some heating_type_val_loc", number_of_balconies: 42, suggested_installment_loan: 120.5, locale: "some locale", number_of_bedroms: 42, property_type_val_loc: "some property_type_val_loc", heating_type_val_en: "some heating_type_val_en", currency_val: "some currency_val", is_logical_deleted: true, street_number: "some street_number", bathroom_area_m2: 120.5, balcony: true, short_description: "some short_description", total_area_m2: 120.5, number_of_bathrooms: 42, apartment: "some apartment", price: 120.5, street: "some street", number_of_rooms: 42, type_of_building_val_en: "some type_of_building_val_en", block: "some block", kitchen_type_val_en: "some kitchen_type_val_en", is_active: true, indoor_area_m2: 120.5, description: "some description", elevator: true, house_equipment_description: "some house_equipment_description", year_of_construction: 42, backyard: true, furniture_set: true, active: true, kitchen_type_val_loc: "some kitchen_type_val_loc", position: 42, logical_deleted: true, house_equipment: true, cards: "some cards", accessible_without_stairs: true, name: "some name", floor: "some floor"}
  @update_attrs %{room_height_cm: 43, price_per_square_meter: 456.7, type_of_building_val_loc: "some updated type_of_building_val_loc", geo_area_loc: "some updated geo_area_loc", geo_area_canonical: "some updated geo_area_canonical", property_type_val_en: "some updated property_type_val_en", terrace: false, geolocation: 456.7, heating_type_val_loc: "some updated heating_type_val_loc", number_of_balconies: 43, suggested_installment_loan: 456.7, locale: "some updated locale", number_of_bedroms: 43, property_type_val_loc: "some updated property_type_val_loc", heating_type_val_en: "some updated heating_type_val_en", currency_val: "some updated currency_val", is_logical_deleted: false, street_number: "some updated street_number", bathroom_area_m2: 456.7, balcony: false, short_description: "some updated short_description", total_area_m2: 456.7, number_of_bathrooms: 43, apartment: "some updated apartment", price: 456.7, street: "some updated street", number_of_rooms: 43, type_of_building_val_en: "some updated type_of_building_val_en", block: "some updated block", kitchen_type_val_en: "some updated kitchen_type_val_en", is_active: false, indoor_area_m2: 456.7, description: "some updated description", elevator: false, house_equipment_description: "some updated house_equipment_description", year_of_construction: 43, backyard: false, furniture_set: false, active: false, kitchen_type_val_loc: "some updated kitchen_type_val_loc", position: 43, logical_deleted: false, house_equipment: false, cards: "some updated cards", accessible_without_stairs: false, name: "some updated name", floor: "some updated floor"}
  @invalid_attrs %{room_height_cm: nil, price_per_square_meter: nil, type_of_building_val_loc: nil, geo_area_loc: nil, geo_area_canonical: nil, property_type_val_en: nil, terrace: nil, geolocation: nil, heating_type_val_loc: nil, number_of_balconies: nil, suggested_installment_loan: nil, locale: nil, number_of_bedroms: nil, property_type_val_loc: nil, heating_type_val_en: nil, currency_val: nil, is_logical_deleted: nil, street_number: nil, bathroom_area_m2: nil, balcony: nil, short_description: nil, total_area_m2: nil, number_of_bathrooms: nil, apartment: nil, price: nil, street: nil, number_of_rooms: nil, type_of_building_val_en: nil, block: nil, kitchen_type_val_en: nil, is_active: nil, indoor_area_m2: nil, description: nil, elevator: nil, house_equipment_description: nil, year_of_construction: nil, backyard: nil, furniture_set: nil, active: nil, kitchen_type_val_loc: nil, position: nil, logical_deleted: nil, house_equipment: nil, cards: nil, accessible_without_stairs: nil, name: nil, floor: nil}

  def fixture(:real_estate) do
    {:ok, real_estate} = Pulap.create_real_estate(@create_attrs)
    real_estate
  end

  describe "index" do
    test "lists all real_estates", %{conn: conn} do
      conn = get conn, real_estate_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Real estates"
    end
  end

  describe "new real_estate" do
    test "renders form", %{conn: conn} do
      conn = get conn, real_estate_path(conn, :new)
      assert html_response(conn, 200) =~ "New Real estate"
    end
  end

  describe "create real_estate" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, real_estate_path(conn, :create), real_estate: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == real_estate_path(conn, :show, id)

      conn = get conn, real_estate_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Real estate"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, real_estate_path(conn, :create), real_estate: @invalid_attrs
      assert html_response(conn, 200) =~ "New Real estate"
    end
  end

  describe "edit real_estate" do
    setup [:create_real_estate]

    test "renders form for editing chosen real_estate", %{conn: conn, real_estate: real_estate} do
      conn = get conn, real_estate_path(conn, :edit, real_estate)
      assert html_response(conn, 200) =~ "Edit Real estate"
    end
  end

  describe "update real_estate" do
    setup [:create_real_estate]

    test "redirects when data is valid", %{conn: conn, real_estate: real_estate} do
      conn = put conn, real_estate_path(conn, :update, real_estate), real_estate: @update_attrs
      assert redirected_to(conn) == real_estate_path(conn, :show, real_estate)

      conn = get conn, real_estate_path(conn, :show, real_estate)
      assert html_response(conn, 200) =~ "some updated type_of_building_val_loc"
    end

    test "renders errors when data is invalid", %{conn: conn, real_estate: real_estate} do
      conn = put conn, real_estate_path(conn, :update, real_estate), real_estate: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Real estate"
    end
  end

  describe "delete real_estate" do
    setup [:create_real_estate]

    test "deletes chosen real_estate", %{conn: conn, real_estate: real_estate} do
      conn = delete conn, real_estate_path(conn, :delete, real_estate)
      assert redirected_to(conn) == real_estate_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, real_estate_path(conn, :show, real_estate)
      end
    end
  end

  defp create_real_estate(_) do
    real_estate = fixture(:real_estate)
    {:ok, real_estate: real_estate}
  end
end
