defmodule Pulap.Geo do
  @moduledoc """
  The Geo context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.Geo.GeoArea

  @doc """
  Returns the list of geo_areas.

  ## Examples

      iex> list_geo_areas()
      [%GeoArea{}, ...]

  """
  def list_geo_areas do
    Repo.all(GeoArea)
  end

  @doc """
  Gets a single geo_area.

  Raises `Ecto.NoResultsError` if the Geo area does not exist.

  ## Examples

      iex> get_geo_area!(123)
      %GeoArea{}

      iex> get_geo_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_geo_area!(id), do: Repo.get!(GeoArea, id)

  @doc """
  Creates a geo_area.

  ## Examples

      iex> create_geo_area(%{field: value})
      {:ok, %GeoArea{}}

      iex> create_geo_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_geo_area(attrs \\ %{}) do
    %GeoArea{}
    |> GeoArea.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a geo_area.

  ## Examples

      iex> update_geo_area(geo_area, %{field: new_value})
      {:ok, %GeoArea{}}

      iex> update_geo_area(geo_area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_geo_area(%GeoArea{} = geo_area, attrs) do
    geo_area
    |> GeoArea.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GeoArea.

  ## Examples

      iex> delete_geo_area(geo_area)
      {:ok, %GeoArea{}}

      iex> delete_geo_area(geo_area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_geo_area(%GeoArea{} = geo_area) do
    Repo.delete(geo_area)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking geo_area changes.

  ## Examples

      iex> change_geo_area(geo_area)
      %Ecto.Changeset{source: %GeoArea{}}

  """
  def change_geo_area(%GeoArea{} = geo_area) do
    GeoArea.changeset(geo_area, %{})
  end
end
