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
  def list_properties_sets do
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
end
