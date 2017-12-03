defmodule Pulap.App do
  @moduledoc """
  The App context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.App.PropertySet

  @doc """
  Returns the list of property_set.

  ## Examples

      iex> list_property_set()
      [%PropertySet{}, ...]

  """
  def list_property_sets do
    Repo.all(PropertySet)
  end

  @doc """
  Gets a single property_set.

  Raises `Ecto.NoResultsError` if the Property set does not exist.

  ## Examples

      iex> get_property_set!(123)
      %PropertySet{}

      iex> get_property_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_property_set!(id), do: Repo.get!(PropertySet, id)

  @doc """
  Creates a property_set.

  ## Examples

      iex> create_property_set(%{field: value})
      {:ok, %PropertySet{}}

      iex> create_property_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_property_set(attrs \\ %{}) do
    %PropertySet{}
    |> PropertySet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property_set.

  ## Examples

      iex> update_property_set(property_set, %{field: new_value})
      {:ok, %PropertySet{}}

      iex> update_property_set(property_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_property_set(%PropertySet{} = property_set, attrs) do
    property_set
    |> PropertySet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PropertySet.

  ## Examples

      iex> delete_property_set(property_set)
      {:ok, %PropertySet{}}

      iex> delete_property_set(property_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_property_set(%PropertySet{} = property_set) do
    Repo.delete(property_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property_set changes.

  ## Examples

      iex> change_property_set(property_set)
      %Ecto.Changeset{source: %PropertySet{}}

  """
  def change_property_set(%PropertySet{} = property_set) do
    PropertySet.changeset(property_set, %{})
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

  alias Pulap.App.KeyValue

  @doc """
  Returns the list of key_values.

  ## Examples

      iex> list_key_values()
      [%KeyValue{}, ...]

  """
  def list_key_values do
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
