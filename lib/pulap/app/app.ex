defmodule Pulap.App do
  @moduledoc """
  The App context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.App.PropertiesSet

  @doc """
  Returns the list of properties_set.

  ## Examples

      iex> list_properties_set()
      [%PropertiesSet{}, ...]

  """
  def list_property_sets do
    Repo.all(PropertiesSet)
  end

  @doc """
  Gets a single properties_set.

  Raises `Ecto.NoResultsError` if the Properties set does not exist.

  ## Examples

      iex> get_properties_set!(123)
      %PropertiesSet{}

      iex> get_properties_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_properties_set!(id), do: Repo.get!(PropertiesSet, id)

  @doc """
  Creates a properties_set.

  ## Examples

      iex> create_properties_set(%{field: value})
      {:ok, %PropertiesSet{}}

      iex> create_properties_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_properties_set(attrs \\ %{}) do
    %PropertiesSet{}
    |> PropertiesSet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a properties_set.

  ## Examples

      iex> update_properties_set(properties_set, %{field: new_value})
      {:ok, %PropertiesSet{}}

      iex> update_properties_set(properties_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_properties_set(%PropertiesSet{} = properties_set, attrs) do
    properties_set
    |> PropertiesSet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PropertiesSet.

  ## Examples

      iex> delete_properties_set(properties_set)
      {:ok, %PropertiesSet{}}

      iex> delete_properties_set(properties_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_properties_set(%PropertiesSet{} = properties_set) do
    Repo.delete(properties_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking properties_set changes.

  ## Examples

      iex> change_properties_set(properties_set)
      %Ecto.Changeset{source: %PropertiesSet{}}

  """
  def change_properties_set(%PropertiesSet{} = properties_set) do
    PropertiesSet.changeset(properties_set, %{})
  end

  alias Pulap.App.Property

  @doc """
  Returns the list of properties.

  ## Examples

      iex> list_properties()
      [%Property{}, ...]

  """
  def list_properties do
    Repo.all(Property)
  end

  @doc """
  Gets a single property.

  Raises `Ecto.NoResultsError` if the Property does not exist.

  ## Examples

      iex> get_property!(123)
      %Property{}

      iex> get_property!(456)
      ** (Ecto.NoResultsError)

  """
  def get_property!(id), do: Repo.get!(Property, id)

  @doc """
  Creates a property.

  ## Examples

      iex> create_property(%{field: value})
      {:ok, %Property{}}

      iex> create_property(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_property(attrs \\ %{}) do
    %Property{}
    |> Property.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property.

  ## Examples

      iex> update_property(property, %{field: new_value})
      {:ok, %Property{}}

      iex> update_property(property, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_property(%Property{} = property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Property.

  ## Examples

      iex> delete_property(property)
      {:ok, %Property{}}

      iex> delete_property(property)
      {:error, %Ecto.Changeset{}}

  """
  def delete_property(%Property{} = property) do
    Repo.delete(property)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property changes.

  ## Examples

      iex> change_property(property)
      %Ecto.Changeset{source: %Property{}}

  """
  def change_property(%Property{} = property) do
    Property.changeset(property, %{})
  end

  alias Pulap.App.PlanSubscription

  @doc """
  Returns the list of plan_subscriptions.

  ## Examples

      iex> list_plan_subscriptions()
      [%PlanSubscription{}, ...]

  """
  def list_plan_subscriptions do
    Repo.all(PlanSubscription)
  end

  @doc """
  Gets a single plan_subscription.

  Raises `Ecto.NoResultsError` if the Plan subscription does not exist.

  ## Examples

      iex> get_plan_subscription!(123)
      %PlanSubscription{}

      iex> get_plan_subscription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plan_subscription!(id), do: Repo.get!(PlanSubscription, id)

  @doc """
  Creates a plan_subscription.

  ## Examples

      iex> create_plan_subscription(%{field: value})
      {:ok, %PlanSubscription{}}

      iex> create_plan_subscription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plan_subscription(attrs \\ %{}) do
    %PlanSubscription{}
    |> PlanSubscription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plan_subscription.

  ## Examples

      iex> update_plan_subscription(plan_subscription, %{field: new_value})
      {:ok, %PlanSubscription{}}

      iex> update_plan_subscription(plan_subscription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plan_subscription(%PlanSubscription{} = plan_subscription, attrs) do
    plan_subscription
    |> PlanSubscription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PlanSubscription.

  ## Examples

      iex> delete_plan_subscription(plan_subscription)
      {:ok, %PlanSubscription{}}

      iex> delete_plan_subscription(plan_subscription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plan_subscription(%PlanSubscription{} = plan_subscription) do
    Repo.delete(plan_subscription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plan_subscription changes.

  ## Examples

      iex> change_plan_subscription(plan_subscription)
      %Ecto.Changeset{source: %PlanSubscription{}}

  """
  def change_plan_subscription(%PlanSubscription{} = plan_subscription) do
    PlanSubscription.changeset(plan_subscription, %{})
  end

  alias Pulap.App.Plan

  @doc """
  Returns the list of plans.

  ## Examples

      iex> list_plans()
      [%Plan{}, ...]

  """
  def list_plans do
    Repo.all(Plan)
  end

  @doc """
  Gets a single plan.

  Raises `Ecto.NoResultsError` if the Plan does not exist.

  ## Examples

      iex> get_plan!(123)
      %Plan{}

      iex> get_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plan!(id), do: Repo.get!(Plan, id)

  @doc """
  Creates a plan.

  ## Examples

      iex> create_plan(%{field: value})
      {:ok, %Plan{}}

      iex> create_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plan(attrs \\ %{}) do
    %Plan{}
    |> Plan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plan.

  ## Examples

      iex> update_plan(plan, %{field: new_value})
      {:ok, %Plan{}}

      iex> update_plan(plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plan(%Plan{} = plan, attrs) do
    plan
    |> Plan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Plan.

  ## Examples

      iex> delete_plan(plan)
      {:ok, %Plan{}}

      iex> delete_plan(plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plan(%Plan{} = plan) do
    Repo.delete(plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plan changes.

  ## Examples

      iex> change_plan(plan)
      %Ecto.Changeset{source: %Plan{}}

  """
  def change_plan(%Plan{} = plan) do
    Plan.changeset(plan, %{})
  end

  alias Pulap.App.KeyValue

  @doc """
  Returns the list of keyvalues.

  ## Examples

      iex> list_keyvalues()
      [%KeyValue{}, ...]

  """
  def list_keyvalues do
    Repo.all(KeyValue)
  end

  @doc """
  Gets a single key_value.

  Raises `Ecto.NoResultsError` if the Key value does not exist.

  ## Examples

      iex> get_key_value!(123)
      %KeyValue{}

      iex> get_key_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_key_value!(id), do: Repo.get!(KeyValue, id)

  @doc """
  Creates a key_value.

  ## Examples

      iex> create_key_value(%{field: value})
      {:ok, %KeyValue{}}

      iex> create_key_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_key_value(attrs \\ %{}) do
    %KeyValue{}
    |> KeyValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a key_value.

  ## Examples

      iex> update_key_value(key_value, %{field: new_value})
      {:ok, %KeyValue{}}

      iex> update_key_value(key_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_key_value(%KeyValue{} = key_value, attrs) do
    key_value
    |> KeyValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a KeyValue.

  ## Examples

      iex> delete_key_value(key_value)
      {:ok, %KeyValue{}}

      iex> delete_key_value(key_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_key_value(%KeyValue{} = key_value) do
    Repo.delete(key_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking key_value changes.

  ## Examples

      iex> change_key_value(key_value)
      %Ecto.Changeset{source: %KeyValue{}}

  """
  def change_key_value(%KeyValue{} = key_value) do
    KeyValue.changeset(key_value, %{})
  end
end
