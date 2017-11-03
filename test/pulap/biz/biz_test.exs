defmodule Pulap.BizTest do
  use Pulap.DataCase

  alias Pulap.Biz

  describe "currencies" do
    alias Pulap.Biz.Currency

    @valid_attrs %{code: "some code", icon: "some icon", is_active: true, is_logical_deleted: true, minor_unit: "some minor_unit", name: "some name", num_code: "some num_code"}
    @update_attrs %{code: "some updated code", icon: "some updated icon", is_active: false, is_logical_deleted: false, minor_unit: "some updated minor_unit", name: "some updated name", num_code: "some updated num_code"}
    @invalid_attrs %{code: nil, icon: nil, is_active: nil, is_logical_deleted: nil, minor_unit: nil, name: nil, num_code: nil}

    def currency_fixture(attrs \\ %{}) do
      {:ok, currency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_currency()

      currency
    end

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert Biz.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert Biz.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      assert {:ok, %Currency{} = currency} = Biz.create_currency(@valid_attrs)
      assert currency.code == "some code"
      assert currency.icon == "some icon"
      assert currency.is_active == true
      assert currency.is_logical_deleted == true
      assert currency.minor_unit == "some minor_unit"
      assert currency.name == "some name"
      assert currency.num_code == "some num_code"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      assert {:ok, currency} = Biz.update_currency(currency, @update_attrs)
      assert %Currency{} = currency
      assert currency.code == "some updated code"
      assert currency.icon == "some updated icon"
      assert currency.is_active == false
      assert currency.is_logical_deleted == false
      assert currency.minor_unit == "some updated minor_unit"
      assert currency.name == "some updated name"
      assert currency.num_code == "some updated num_code"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_currency(currency, @invalid_attrs)
      assert currency == Biz.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = Biz.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = Biz.change_currency(currency)
    end
  end

  describe "real_estates" do
    alias Pulap.Biz.RealEstate

    @valid_attrs %{room_height_cm: 42, price_per_square_meter: 120.5, type_of_building_val_loc: "some type_of_building_val_loc", geo_area_loc: "some geo_area_loc", geo_area_canonical: "some geo_area_canonical", property_type_val_en: "some property_type_val_en", terrace: true, geolocation: 120.5, heating_type_val_loc: "some heating_type_val_loc", number_of_balconies: 42, suggested_installment_loan: 120.5, locale: "some locale", number_of_bedroms: 42, property_type_val_loc: "some property_type_val_loc", heating_type_val_en: "some heating_type_val_en", currency_val: "some currency_val", is_logical_deleted: true, street_number: "some street_number", bathroom_area_m2: 120.5, balcony: true, short_description: "some short_description", total_area_m2: 120.5, number_of_bathrooms: 42, apartment_number: "some apartment_number", price: 120.5, street: "some street", number_of_rooms: 42, type_of_building_val_en: "some type_of_building_val_en", block: "some block", kitchen_type_val_en: "some kitchen_type_val_en", is_active: true, indoor_area_m2: 120.5, description: "some description", elevator: true, house_equipment_description: "some house_equipment_description", year_of_construction: 42, backyard: true, furniture_set: true, active: true, kitchen_type_val_loc: "some kitchen_type_val_loc", position: 42, logical_deleted: true, house_equipment: true, cards: "some cards", accessible_without_stairs: true, name: "some name", floor: "some floor"}
    @update_attrs %{room_height_cm: 43, price_per_square_meter: 456.7, type_of_building_val_loc: "some updated type_of_building_val_loc", geo_area_loc: "some updated geo_area_loc", geo_area_canonical: "some updated geo_area_canonical", property_type_val_en: "some updated property_type_val_en", terrace: false, geolocation: 456.7, heating_type_val_loc: "some updated heating_type_val_loc", number_of_balconies: 43, suggested_installment_loan: 456.7, locale: "some updated locale", number_of_bedroms: 43, property_type_val_loc: "some updated property_type_val_loc", heating_type_val_en: "some updated heating_type_val_en", currency_val: "some updated currency_val", is_logical_deleted: false, street_number: "some updated street_number", bathroom_area_m2: 456.7, balcony: false, short_description: "some updated short_description", total_area_m2: 456.7, number_of_bathrooms: 43, apartment_number: "some updated apartment_number", price: 456.7, street: "some updated street", number_of_rooms: 43, type_of_building_val_en: "some updated type_of_building_val_en", block: "some updated block", kitchen_type_val_en: "some updated kitchen_type_val_en", is_active: false, indoor_area_m2: 456.7, description: "some updated description", elevator: false, house_equipment_description: "some updated house_equipment_description", year_of_construction: 43, backyard: false, furniture_set: false, active: false, kitchen_type_val_loc: "some updated kitchen_type_val_loc", position: 43, logical_deleted: false, house_equipment: false, cards: "some updated cards", accessible_without_stairs: false, name: "some updated name", floor: "some updated floor"}
    @invalid_attrs %{room_height_cm: nil, price_per_square_meter: nil, type_of_building_val_loc: nil, geo_area_loc: nil, geo_area_canonical: nil, property_type_val_en: nil, terrace: nil, geolocation: nil, heating_type_val_loc: nil, number_of_balconies: nil, suggested_installment_loan: nil, locale: nil, number_of_bedroms: nil, property_type_val_loc: nil, heating_type_val_en: nil, currency_val: nil, is_logical_deleted: nil, street_number: nil, bathroom_area_m2: nil, balcony: nil, short_description: nil, total_area_m2: nil, number_of_bathrooms: nil, apartment_number: nil, price: nil, street: nil, number_of_rooms: nil, type_of_building_val_en: nil, block: nil, kitchen_type_val_en: nil, is_active: nil, indoor_area_m2: nil, description: nil, elevator: nil, house_equipment_description: nil, year_of_construction: nil, backyard: nil, furniture_set: nil, active: nil, kitchen_type_val_loc: nil, position: nil, logical_deleted: nil, house_equipment: nil, cards: nil, accessible_without_stairs: nil, name: nil, floor: nil}

    def real_estate_fixture(attrs \\ %{}) do
      {:ok, real_estate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pulap.create_real_estate()

      real_estate
    end

    test "list_real_estates/0 returns all real_estates" do
      real_estate = real_estate_fixture()
      assert Pulap.list_real_estates() == [real_estate]
    end

    test "get_real_estate!/1 returns the real_estate with given id" do
      real_estate = real_estate_fixture()
      assert Pulap.get_real_estate!(real_estate.id) == real_estate
    end

    test "create_real_estate/1 with valid data creates a real_estate" do
      assert {:ok, %RealEstate{} = real_estate} = Pulap.create_real_estate(@valid_attrs)
      assert real_estate.room_height_cm == 42
      assert real_estate.price_per_square_meter == 120.5
      assert real_estate.type_of_building_val_loc == "some type_of_building_val_loc"
      assert real_estate.geo_area_loc == "some geo_area_loc"
      assert real_estate.geo_area_canonical == "some geo_area_canonical"
      assert real_estate.property_type_val_en == "some property_type_val_en"
      assert real_estate.terrace == true
      assert real_estate.geolocation == 120.5
      assert real_estate.heating_type_val_loc == "some heating_type_val_loc"
      assert real_estate.number_of_balconies == 42
      assert real_estate.suggested_installment_loan == 120.5
      assert real_estate.locale == "some locale"
      assert real_estate.number_of_bedroms == 42
      assert real_estate.property_type_val_loc == "some property_type_val_loc"
      assert real_estate.heating_type_val_en == "some heating_type_val_en"
      assert real_estate.currency_val == "some currency_val"
      assert real_estate.is_logical_deleted == true
      assert real_estate.street_number == "some street_number"
      assert real_estate.bathroom_area_m2 == 120.5
      assert real_estate.balcony == true
      assert real_estate.short_description == "some short_description"
      assert real_estate.total_area_m2 == 120.5
      assert real_estate.number_of_bathrooms == 42
      assert real_estate.apartment_number == "some apartment_number"
      assert real_estate.price == 120.5
      assert real_estate.street == "some street"
      assert real_estate.number_of_rooms == 42
      assert real_estate.type_of_building_val_en == "some type_of_building_val_en"
      assert real_estate.block == "some block"
      assert real_estate.kitchen_type_val_en == "some kitchen_type_val_en"
      assert real_estate.is_active == true
      assert real_estate.indoor_area_m2 == 120.5
      assert real_estate.description == "some description"
      assert real_estate.elevator == true
      assert real_estate.house_equipment_description == "some house_equipment_description"
      assert real_estate.year_of_construction == 42
      assert real_estate.backyard == true
      assert real_estate.furniture_set == true
      assert real_estate.active == true
      assert real_estate.kitchen_type_val_loc == "some kitchen_type_val_loc"
      assert real_estate.position == 42
      assert real_estate.logical_deleted == true
      assert real_estate.house_equipment == true
      assert real_estate.cards == "some cards"
      assert real_estate.accessible_without_stairs == true
      assert real_estate.name == "some name"
      assert real_estate.floor == "some floor"
    end

    test "create_real_estate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pulap.create_real_estate(@invalid_attrs)
    end

    test "update_real_estate/2 with valid data updates the real_estate" do
      real_estate = real_estate_fixture()
      assert {:ok, real_estate} = Pulap.update_real_estate(real_estate, @update_attrs)
      assert %RealEstate{} = real_estate
      assert real_estate.room_height_cm == 43
      assert real_estate.price_per_square_meter == 456.7
      assert real_estate.type_of_building_val_loc == "some updated type_of_building_val_loc"
      assert real_estate.geo_area_loc == "some updated geo_area_loc"
      assert real_estate.geo_area_canonical == "some updated geo_area_canonical"
      assert real_estate.property_type_val_en == "some updated property_type_val_en"
      assert real_estate.terrace == false
      assert real_estate.geolocation == 456.7
      assert real_estate.heating_type_val_loc == "some updated heating_type_val_loc"
      assert real_estate.number_of_balconies == 43
      assert real_estate.suggested_installment_loan == 456.7
      assert real_estate.locale == "some updated locale"
      assert real_estate.number_of_bedroms == 43
      assert real_estate.property_type_val_loc == "some updated property_type_val_loc"
      assert real_estate.heating_type_val_en == "some updated heating_type_val_en"
      assert real_estate.currency_val == "some updated currency_val"
      assert real_estate.is_logical_deleted == false
      assert real_estate.street_number == "some updated street_number"
      assert real_estate.bathroom_area_m2 == 456.7
      assert real_estate.balcony == false
      assert real_estate.short_description == "some updated short_description"
      assert real_estate.total_area_m2 == 456.7
      assert real_estate.number_of_bathrooms == 43
      assert real_estate.apartment_number == "some updated apartment_number"
      assert real_estate.price == 456.7
      assert real_estate.street == "some updated street"
      assert real_estate.number_of_rooms == 43
      assert real_estate.type_of_building_val_en == "some updated type_of_building_val_en"
      assert real_estate.block == "some updated block"
      assert real_estate.kitchen_type_val_en == "some updated kitchen_type_val_en"
      assert real_estate.is_active == false
      assert real_estate.indoor_area_m2 == 456.7
      assert real_estate.description == "some updated description"
      assert real_estate.elevator == false
      assert real_estate.house_equipment_description == "some updated house_equipment_description"
      assert real_estate.year_of_construction == 43
      assert real_estate.backyard == false
      assert real_estate.furniture_set == false
      assert real_estate.active == false
      assert real_estate.kitchen_type_val_loc == "some updated kitchen_type_val_loc"
      assert real_estate.position == 43
      assert real_estate.logical_deleted == false
      assert real_estate.house_equipment == false
      assert real_estate.cards == "some updated cards"
      assert real_estate.accessible_without_stairs == false
      assert real_estate.name == "some updated name"
      assert real_estate.floor == "some updated floor"
    end

    test "update_real_estate/2 with invalid data returns error changeset" do
      real_estate = real_estate_fixture()
      assert {:error, %Ecto.Changeset{}} = Pulap.update_real_estate(real_estate, @invalid_attrs)
      assert real_estate == Pulap.get_real_estate!(real_estate.id)
    end

    test "delete_real_estate/1 deletes the real_estate" do
      real_estate = real_estate_fixture()
      assert {:ok, %RealEstate{}} = Pulap.delete_real_estate(real_estate)
      assert_raise Ecto.NoResultsError, fn -> Pulap.get_real_estate!(real_estate.id) end
    end

    test "change_real_estate/1 returns a real_estate changeset" do
      real_estate = real_estate_fixture()
      assert %Ecto.Changeset{} = Pulap.change_real_estate(real_estate)
    end
  end

  describe "tenures" do
    alias Pulap.Biz.Tenure

    @valid_attrs %{ends_at: "2010-04-17 14:00:00.000000Z", is_active: true, is_logical_deleted: true, job_description: "some job_description", job_title: "some job_title", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{ends_at: "2011-05-18 15:01:01.000000Z", is_active: false, is_logical_deleted: false, job_description: "some updated job_description", job_title: "some updated job_title", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{ends_at: nil, is_active: nil, is_logical_deleted: nil, job_description: nil, job_title: nil, started_at: nil}

    def tenure_fixture(attrs \\ %{}) do
      {:ok, tenure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_tenure()

      tenure
    end

    test "list_tenures/0 returns all tenures" do
      tenure = tenure_fixture()
      assert Biz.list_tenures() == [tenure]
    end

    test "get_tenure!/1 returns the tenure with given id" do
      tenure = tenure_fixture()
      assert Biz.get_tenure!(tenure.id) == tenure
    end

    test "create_tenure/1 with valid data creates a tenure" do
      assert {:ok, %Tenure{} = tenure} = Biz.create_tenure(@valid_attrs)
      assert tenure.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert tenure.is_active == true
      assert tenure.is_logical_deleted == true
      assert tenure.job_description == "some job_description"
      assert tenure.job_title == "some job_title"
      assert tenure.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_tenure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_tenure(@invalid_attrs)
    end

    test "update_tenure/2 with valid data updates the tenure" do
      tenure = tenure_fixture()
      assert {:ok, tenure} = Biz.update_tenure(tenure, @update_attrs)
      assert %Tenure{} = tenure
      assert tenure.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert tenure.is_active == false
      assert tenure.is_logical_deleted == false
      assert tenure.job_description == "some updated job_description"
      assert tenure.job_title == "some updated job_title"
      assert tenure.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_tenure/2 with invalid data returns error changeset" do
      tenure = tenure_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_tenure(tenure, @invalid_attrs)
      assert tenure == Biz.get_tenure!(tenure.id)
    end

    test "delete_tenure/1 deletes the tenure" do
      tenure = tenure_fixture()
      assert {:ok, %Tenure{}} = Biz.delete_tenure(tenure)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_tenure!(tenure.id) end
    end

    test "change_tenure/1 returns a tenure changeset" do
      tenure = tenure_fixture()
      assert %Ecto.Changeset{} = Biz.change_tenure(tenure)
    end
  end
end
