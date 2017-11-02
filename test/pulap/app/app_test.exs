defmodule Pulap.AppTest do
  use Pulap.DataCase

  alias Pulap.App

  describe "properties_set" do
    alias Pulap.App.PropertiesSet

    @valid_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def properties_set_fixture(attrs \\ %{}) do
      {:ok, properties_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_properties_set()

      properties_set
    end

    test "list_properties_set/0 returns all properties_set" do
      properties_set = properties_set_fixture()
      assert App.list_properties_set() == [properties_set]
    end

    test "get_properties_set!/1 returns the properties_set with given id" do
      properties_set = properties_set_fixture()
      assert App.get_properties_set!(properties_set.id) == properties_set
    end

    test "create_properties_set/1 with valid data creates a properties_set" do
      assert {:ok, %PropertiesSet{} = properties_set} = App.create_properties_set(@valid_attrs)
      assert properties_set.description == "some description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.is_active == true
      assert properties_set.is_logical_deleted == true
      assert properties_set.name == "some name"
      assert properties_set.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_properties_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_properties_set(@invalid_attrs)
    end

    test "update_properties_set/2 with valid data updates the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, properties_set} = App.update_properties_set(properties_set, @update_attrs)
      assert %PropertiesSet{} = properties_set
      assert properties_set.description == "some updated description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.is_active == false
      assert properties_set.is_logical_deleted == false
      assert properties_set.name == "some updated name"
      assert properties_set.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_properties_set/2 with invalid data returns error changeset" do
      properties_set = properties_set_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_properties_set(properties_set, @invalid_attrs)
      assert properties_set == App.get_properties_set!(properties_set.id)
    end

    test "delete_properties_set/1 deletes the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, %PropertiesSet{}} = App.delete_properties_set(properties_set)
      assert_raise Ecto.NoResultsError, fn -> App.get_properties_set!(properties_set.id) end
    end

    test "change_properties_set/1 returns a properties_set changeset" do
      properties_set = properties_set_fixture()
      assert %Ecto.Changeset{} = App.change_properties_set(properties_set)
    end
  end

  describe "property_sets" do
    alias Pulap.App.PropertiesSet

    @valid_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def properties_set_fixture(attrs \\ %{}) do
      {:ok, properties_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_properties_set()

      properties_set
    end

    test "list_property_sets/0 returns all property_sets" do
      properties_set = properties_set_fixture()
      assert App.list_property_sets() == [properties_set]
    end

    test "get_properties_set!/1 returns the properties_set with given id" do
      properties_set = properties_set_fixture()
      assert App.get_properties_set!(properties_set.id) == properties_set
    end

    test "create_properties_set/1 with valid data creates a properties_set" do
      assert {:ok, %PropertiesSet{} = properties_set} = App.create_properties_set(@valid_attrs)
      assert properties_set.description == "some description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.is_active == true
      assert properties_set.is_logical_deleted == true
      assert properties_set.name == "some name"
      assert properties_set.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_properties_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_properties_set(@invalid_attrs)
    end

    test "update_properties_set/2 with valid data updates the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, properties_set} = App.update_properties_set(properties_set, @update_attrs)
      assert %PropertiesSet{} = properties_set
      assert properties_set.description == "some updated description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.is_active == false
      assert properties_set.is_logical_deleted == false
      assert properties_set.name == "some updated name"
      assert properties_set.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_properties_set/2 with invalid data returns error changeset" do
      properties_set = properties_set_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_properties_set(properties_set, @invalid_attrs)
      assert properties_set == App.get_properties_set!(properties_set.id)
    end

    test "delete_properties_set/1 deletes the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, %PropertiesSet{}} = App.delete_properties_set(properties_set)
      assert_raise Ecto.NoResultsError, fn -> App.get_properties_set!(properties_set.id) end
    end

    test "change_properties_set/1 returns a properties_set changeset" do
      properties_set = properties_set_fixture()
      assert %Ecto.Changeset{} = App.change_properties_set(properties_set)
    end
  end

  describe "properties" do
    alias Pulap.App.Property

    @valid_attrs %{boolean: true, date: ~D[2010-04-17], datetime: ~N[2010-04-17 14:00:00.000000], decimal: "120.5", description: "some description", float: 120.5, geolocation: 120.5, id: "7488a646-e31f-11e4-aace-600308960662", integer: 42, is_active: true, is_logical_deleted: true, name: "some name", properties_set_name: "some properties_set_name", property_data_type: "some property_data_type", string: "some string", time: ~T[14:00:00.000000], uuid: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{boolean: false, date: ~D[2011-05-18], datetime: ~N[2011-05-18 15:01:01.000000], decimal: "456.7", description: "some updated description", float: 456.7, geolocation: 456.7, id: "7488a646-e31f-11e4-aace-600308960668", integer: 43, is_active: false, is_logical_deleted: false, name: "some updated name", properties_set_name: "some updated properties_set_name", property_data_type: "some updated property_data_type", string: "some updated string", time: ~T[15:01:01.000000], uuid: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{boolean: nil, date: nil, datetime: nil, decimal: nil, description: nil, float: nil, geolocation: nil, id: nil, integer: nil, is_active: nil, is_logical_deleted: nil, name: nil, properties_set_name: nil, property_data_type: nil, string: nil, time: nil, uuid: nil}

    def property_fixture(attrs \\ %{}) do
      {:ok, property} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_property()

      property
    end

    test "list_properties/0 returns all properties" do
      property = property_fixture()
      assert App.list_properties() == [property]
    end

    test "get_property!/1 returns the property with given id" do
      property = property_fixture()
      assert App.get_property!(property.id) == property
    end

    test "create_property/1 with valid data creates a property" do
      assert {:ok, %Property{} = property} = App.create_property(@valid_attrs)
      assert property.boolean == true
      assert property.date == ~D[2010-04-17]
      assert property.datetime == ~N[2010-04-17 14:00:00.000000]
      assert property.decimal == Decimal.new("120.5")
      assert property.description == "some description"
      assert property.float == 120.5
      assert property.geolocation == 120.5
      assert property.id == "7488a646-e31f-11e4-aace-600308960662"
      assert property.integer == 42
      assert property.is_active == true
      assert property.is_logical_deleted == true
      assert property.name == "some name"
      assert property.properties_set_name == "some properties_set_name"
      assert property.property_data_type == "some property_data_type"
      assert property.string == "some string"
      assert property.time == ~T[14:00:00.000000]
      assert property.uuid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_property/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_property(@invalid_attrs)
    end

    test "update_property/2 with valid data updates the property" do
      property = property_fixture()
      assert {:ok, property} = App.update_property(property, @update_attrs)
      assert %Property{} = property
      assert property.boolean == false
      assert property.date == ~D[2011-05-18]
      assert property.datetime == ~N[2011-05-18 15:01:01.000000]
      assert property.decimal == Decimal.new("456.7")
      assert property.description == "some updated description"
      assert property.float == 456.7
      assert property.geolocation == 456.7
      assert property.id == "7488a646-e31f-11e4-aace-600308960668"
      assert property.integer == 43
      assert property.is_active == false
      assert property.is_logical_deleted == false
      assert property.name == "some updated name"
      assert property.properties_set_name == "some updated properties_set_name"
      assert property.property_data_type == "some updated property_data_type"
      assert property.string == "some updated string"
      assert property.time == ~T[15:01:01.000000]
      assert property.uuid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_property/2 with invalid data returns error changeset" do
      property = property_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_property(property, @invalid_attrs)
      assert property == App.get_property!(property.id)
    end

    test "delete_property/1 deletes the property" do
      property = property_fixture()
      assert {:ok, %Property{}} = App.delete_property(property)
      assert_raise Ecto.NoResultsError, fn -> App.get_property!(property.id) end
    end

    test "change_property/1 returns a property changeset" do
      property = property_fixture()
      assert %Ecto.Changeset{} = App.change_property(property)
    end
  end

  describe "plan_subscriptions" do
    alias Pulap.App.PlanSubscriptions

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_subscriptions_fixture(attrs \\ %{}) do
      {:ok, plan_subscriptions} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_plan_subscriptions()

      plan_subscriptions
    end

    test "list_plan_subscriptions/0 returns all plan_subscriptions" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert App.list_plan_subscriptions() == [plan_subscriptions]
    end

    test "get_plan_subscriptions!/1 returns the plan_subscriptions with given id" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert App.get_plan_subscriptions!(plan_subscriptions.id) == plan_subscriptions
    end

    test "create_plan_subscriptions/1 with valid data creates a plan_subscriptions" do
      assert {:ok, %PlanSubscriptions{} = plan_subscriptions} = App.create_plan_subscriptions(@valid_attrs)
      assert plan_subscriptions.description == "some description"
      assert plan_subscriptions.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan_subscriptions.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan_subscriptions.is_active == true
      assert plan_subscriptions.is_logical_deleted == true
      assert plan_subscriptions.name == "some name"
      assert plan_subscriptions.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan_subscriptions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_plan_subscriptions(@invalid_attrs)
    end

    test "update_plan_subscriptions/2 with valid data updates the plan_subscriptions" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert {:ok, plan_subscriptions} = App.update_plan_subscriptions(plan_subscriptions, @update_attrs)
      assert %PlanSubscriptions{} = plan_subscriptions
      assert plan_subscriptions.description == "some updated description"
      assert plan_subscriptions.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan_subscriptions.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan_subscriptions.is_active == false
      assert plan_subscriptions.is_logical_deleted == false
      assert plan_subscriptions.name == "some updated name"
      assert plan_subscriptions.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan_subscriptions/2 with invalid data returns error changeset" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_plan_subscriptions(plan_subscriptions, @invalid_attrs)
      assert plan_subscriptions == App.get_plan_subscriptions!(plan_subscriptions.id)
    end

    test "delete_plan_subscriptions/1 deletes the plan_subscriptions" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert {:ok, %PlanSubscriptions{}} = App.delete_plan_subscriptions(plan_subscriptions)
      assert_raise Ecto.NoResultsError, fn -> App.get_plan_subscriptions!(plan_subscriptions.id) end
    end

    test "change_plan_subscriptions/1 returns a plan_subscriptions changeset" do
      plan_subscriptions = plan_subscriptions_fixture()
      assert %Ecto.Changeset{} = App.change_plan_subscriptions(plan_subscriptions)
    end
  end

  describe "plan_subscriptions" do
    alias Pulap.App.PlanSubscription

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_subscription_fixture(attrs \\ %{}) do
      {:ok, plan_subscription} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_plan_subscription()

      plan_subscription
    end

    test "list_plan_subscriptions/0 returns all plan_subscriptions" do
      plan_subscription = plan_subscription_fixture()
      assert App.list_plan_subscriptions() == [plan_subscription]
    end

    test "get_plan_subscription!/1 returns the plan_subscription with given id" do
      plan_subscription = plan_subscription_fixture()
      assert App.get_plan_subscription!(plan_subscription.id) == plan_subscription
    end

    test "create_plan_subscription/1 with valid data creates a plan_subscription" do
      assert {:ok, %PlanSubscription{} = plan_subscription} = App.create_plan_subscription(@valid_attrs)
      assert plan_subscription.description == "some description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan_subscription.is_active == true
      assert plan_subscription.is_logical_deleted == true
      assert plan_subscription.name == "some name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_plan_subscription(@invalid_attrs)
    end

    test "update_plan_subscription/2 with valid data updates the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, plan_subscription} = App.update_plan_subscription(plan_subscription, @update_attrs)
      assert %PlanSubscription{} = plan_subscription
      assert plan_subscription.description == "some updated description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan_subscription.is_active == false
      assert plan_subscription.is_logical_deleted == false
      assert plan_subscription.name == "some updated name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan_subscription/2 with invalid data returns error changeset" do
      plan_subscription = plan_subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_plan_subscription(plan_subscription, @invalid_attrs)
      assert plan_subscription == App.get_plan_subscription!(plan_subscription.id)
    end

    test "delete_plan_subscription/1 deletes the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, %PlanSubscription{}} = App.delete_plan_subscription(plan_subscription)
      assert_raise Ecto.NoResultsError, fn -> App.get_plan_subscription!(plan_subscription.id) end
    end

    test "change_plan_subscription/1 returns a plan_subscription changeset" do
      plan_subscription = plan_subscription_fixture()
      assert %Ecto.Changeset{} = App.change_plan_subscription(plan_subscription)
    end
  end

  describe "plans" do
    alias Pulap.App.Plan

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_fixture(attrs \\ %{}) do
      {:ok, plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_plan()

      plan
    end

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert App.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert App.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      assert {:ok, %Plan{} = plan} = App.create_plan(@valid_attrs)
      assert plan.description == "some description"
      assert plan.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan.is_active == true
      assert plan.is_logical_deleted == true
      assert plan.name == "some name"
      assert plan.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      assert {:ok, plan} = App.update_plan(plan, @update_attrs)
      assert %Plan{} = plan
      assert plan.description == "some updated description"
      assert plan.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan.is_active == false
      assert plan.is_logical_deleted == false
      assert plan.name == "some updated name"
      assert plan.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_plan(plan, @invalid_attrs)
      assert plan == App.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = App.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> App.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = App.change_plan(plan)
    end
  end

  describe "key_values" do
    alias Pulap.App.KeyValue

    @valid_attrs %{is_active: true, is_logical_deleted: true, key: "some key", key_group: "some key_group", key_subgroup: "some key_subgroup", locale: "some locale", position: 42, set: "some set", value: "some value"}
    @update_attrs %{is_active: false, is_logical_deleted: false, key: "some updated key", key_group: "some updated key_group", key_subgroup: "some updated key_subgroup", locale: "some updated locale", position: 43, set: "some updated set", value: "some updated value"}
    @invalid_attrs %{is_active: nil, is_logical_deleted: nil, key: nil, key_group: nil, key_subgroup: nil, locale: nil, position: nil, set: nil, value: nil}

    def key_value_fixture(attrs \\ %{}) do
      {:ok, key_value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_key_value()

      key_value
    end

    test "list_key_values/0 returns all key_values" do
      key_value = key_value_fixture()
      assert App.list_key_values() == [key_value]
    end

    test "get_key_value!/1 returns the key_value with given id" do
      key_value = key_value_fixture()
      assert App.get_key_value!(key_value.id) == key_value
    end

    test "create_key_value/1 with valid data creates a key_value" do
      assert {:ok, %KeyValue{} = key_value} = App.create_key_value(@valid_attrs)
      assert key_value.is_active == true
      assert key_value.is_logical_deleted == true
      assert key_value.key == "some key"
      assert key_value.key_group == "some key_group"
      assert key_value.key_subgroup == "some key_subgroup"
      assert key_value.locale == "some locale"
      assert key_value.position == 42
      assert key_value.set == "some set"
      assert key_value.value == "some value"
    end

    test "create_key_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_key_value(@invalid_attrs)
    end

    test "update_key_value/2 with valid data updates the key_value" do
      key_value = key_value_fixture()
      assert {:ok, key_value} = App.update_key_value(key_value, @update_attrs)
      assert %KeyValue{} = key_value
      assert key_value.is_active == false
      assert key_value.is_logical_deleted == false
      assert key_value.key == "some updated key"
      assert key_value.key_group == "some updated key_group"
      assert key_value.key_subgroup == "some updated key_subgroup"
      assert key_value.locale == "some updated locale"
      assert key_value.position == 43
      assert key_value.set == "some updated set"
      assert key_value.value == "some updated value"
    end

    test "update_key_value/2 with invalid data returns error changeset" do
      key_value = key_value_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_key_value(key_value, @invalid_attrs)
      assert key_value == App.get_key_value!(key_value.id)
    end

    test "delete_key_value/1 deletes the key_value" do
      key_value = key_value_fixture()
      assert {:ok, %KeyValue{}} = App.delete_key_value(key_value)
      assert_raise Ecto.NoResultsError, fn -> App.get_key_value!(key_value.id) end
    end

    test "change_key_value/1 returns a key_value changeset" do
      key_value = key_value_fixture()
      assert %Ecto.Changeset{} = App.change_key_value(key_value)
    end
  end
end
