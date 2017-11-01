defmodule Pulap.GeoTest do
  use Pulap.DataCase

  alias Pulap.Geo

  describe "geo_areas" do
    alias Pulap.Geo.GeoArea

    @valid_attrs %{alt_name: "some alt_name", canonical_name: "some canonical_name", cards: "some cards", dialing_code: "some dialing_code", geolocation: 120.5, is_active: true, is_logical_deleted: true, is_main: true, locale: "some locale", locale_canonical_name: "some locale_canonical_name", locale_name: "some locale_name", name: "some name", position: 42, zip_code: "some zip_code"}
    @update_attrs %{alt_name: "some updated alt_name", canonical_name: "some updated canonical_name", cards: "some updated cards", dialing_code: "some updated dialing_code", geolocation: 456.7, is_active: false, is_logical_deleted: false, is_main: false, locale: "some updated locale", locale_canonical_name: "some updated locale_canonical_name", locale_name: "some updated locale_name", name: "some updated name", position: 43, zip_code: "some updated zip_code"}
    @invalid_attrs %{alt_name: nil, canonical_name: nil, cards: nil, dialing_code: nil, geolocation: nil, is_active: nil, is_logical_deleted: nil, is_main: nil, locale: nil, locale_canonical_name: nil, locale_name: nil, name: nil, position: nil, zip_code: nil}

    def geo_area_fixture(attrs \\ %{}) do
      {:ok, geo_area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_geo_area()

      geo_area
    end

    test "list_geo_areas/0 returns all geo_areas" do
      geo_area = geo_area_fixture()
      assert Geo.list_geo_areas() == [geo_area]
    end

    test "get_geo_area!/1 returns the geo_area with given id" do
      geo_area = geo_area_fixture()
      assert Geo.get_geo_area!(geo_area.id) == geo_area
    end

    test "create_geo_area/1 with valid data creates a geo_area" do
      assert {:ok, %GeoArea{} = geo_area} = Geo.create_geo_area(@valid_attrs)
      assert geo_area.alt_name == "some alt_name"
      assert geo_area.canonical_name == "some canonical_name"
      assert geo_area.cards == "some cards"
      assert geo_area.dialing_code == "some dialing_code"
      assert geo_area.geolocation == 120.5
      assert geo_area.is_active == true
      assert geo_area.is_logical_deleted == true
      assert geo_area.is_main == true
      assert geo_area.locale == "some locale"
      assert geo_area.locale_canonical_name == "some locale_canonical_name"
      assert geo_area.locale_name == "some locale_name"
      assert geo_area.name == "some name"
      assert geo_area.position == 42
      assert geo_area.zip_code == "some zip_code"
    end

    test "create_geo_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_geo_area(@invalid_attrs)
    end

    test "update_geo_area/2 with valid data updates the geo_area" do
      geo_area = geo_area_fixture()
      assert {:ok, geo_area} = Geo.update_geo_area(geo_area, @update_attrs)
      assert %GeoArea{} = geo_area
      assert geo_area.alt_name == "some updated alt_name"
      assert geo_area.canonical_name == "some updated canonical_name"
      assert geo_area.cards == "some updated cards"
      assert geo_area.dialing_code == "some updated dialing_code"
      assert geo_area.geolocation == 456.7
      assert geo_area.is_active == false
      assert geo_area.is_logical_deleted == false
      assert geo_area.is_main == false
      assert geo_area.locale == "some updated locale"
      assert geo_area.locale_canonical_name == "some updated locale_canonical_name"
      assert geo_area.locale_name == "some updated locale_name"
      assert geo_area.name == "some updated name"
      assert geo_area.position == 43
      assert geo_area.zip_code == "some updated zip_code"
    end

    test "update_geo_area/2 with invalid data returns error changeset" do
      geo_area = geo_area_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_geo_area(geo_area, @invalid_attrs)
      assert geo_area == Geo.get_geo_area!(geo_area.id)
    end

    test "delete_geo_area/1 deletes the geo_area" do
      geo_area = geo_area_fixture()
      assert {:ok, %GeoArea{}} = Geo.delete_geo_area(geo_area)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_geo_area!(geo_area.id) end
    end

    test "change_geo_area/1 returns a geo_area changeset" do
      geo_area = geo_area_fixture()
      assert %Ecto.Changeset{} = Geo.change_geo_area(geo_area)
    end
  end
end
