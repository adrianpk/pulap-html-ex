defmodule Pulap.Biz do
  @moduledoc """
  The Pulap context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.Biz.RealEstate

  @doc """
  Returns the list of real_estates.

  ## Examples

      iex> list_real_estates()
      [%RealEstate{}, ...]

  """
  def list_real_estates do
    Repo.all(RealEstate)
  end

  @doc """
  Gets a single real_estate.

  Raises `Ecto.NoResultsError` if the Real estate does not exist.

  ## Examples

      iex> get_real_estate!(123)
      %RealEstate{}

      iex> get_real_estate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_real_estate!(id), do: Repo.get!(RealEstate, id)

  @doc """
  Creates a real_estate.

  ## Examples

      iex> create_real_estate(%{field: value})
      {:ok, %RealEstate{}}

      iex> create_real_estate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_real_estate(attrs \\ %{}) do
    %RealEstate{}
    |> RealEstate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a real_estate.

  ## Examples

      iex> update_real_estate(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_real_estate(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_real_estate(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RealEstate.

  ## Examples

      iex> delete_real_estate(real_estate)
      {:ok, %RealEstate{}}

      iex> delete_real_estate(real_estate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_real_estate(%RealEstate{} = real_estate) do
    Repo.delete(real_estate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking real_estate changes.

  ## Examples

      iex> change_real_estate(real_estate)
      %Ecto.Changeset{source: %RealEstate{}}

  """
  def change_real_estate(%RealEstate{} = real_estate) do
    RealEstate.changeset(real_estate, %{})
  end

  alias Pulap.Biz.Currency

  @doc """
  Returns the list of currencies.

  ## Examples

      iex> list_currencies()
      [%Currency{}, ...]

  """
  def list_currencies do
    Repo.all(Currency)
  end

  @doc """
  Gets a single currency.

  Raises `Ecto.NoResultsError` if the Currency does not exist.

  ## Examples

      iex> get_currency!(123)
      %Currency{}

      iex> get_currency!(456)
      ** (Ecto.NoResultsError)

  """
  def get_currency!(id), do: Repo.get!(Currency, id)

  @doc """
  Creates a currency.

  ## Examples

      iex> create_currency(%{field: value})
      {:ok, %Currency{}}

      iex> create_currency(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_currency(attrs \\ %{}) do
    %Currency{}
    |> Currency.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a currency.

  ## Examples

      iex> update_currency(currency, %{field: new_value})
      {:ok, %Currency{}}

      iex> update_currency(currency, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_currency(%Currency{} = currency, attrs) do
    currency
    |> Currency.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Currency.

  ## Examples

      iex> delete_currency(currency)
      {:ok, %Currency{}}

      iex> delete_currency(currency)
      {:error, %Ecto.Changeset{}}

  """
  def delete_currency(%Currency{} = currency) do
    Repo.delete(currency)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking currency changes.

  ## Examples

      iex> change_currency(currency)
      %Ecto.Changeset{source: %Currency{}}

  """
  def change_currency(%Currency{} = currency) do
    Currency.changeset(currency, %{})
  end

  alias Pulap.Biz.Tenure

  @doc """
  Returns the list of tenures.

  ## Examples

      iex> list_tenures()
      [%Tenure{}, ...]

  """
  def list_tenures do
    Repo.all(Tenure)
  end

  @doc """
  Gets a single tenure.

  Raises `Ecto.NoResultsError` if the Tenure does not exist.

  ## Examples

      iex> get_tenure!(123)
      %Tenure{}

      iex> get_tenure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tenure!(id), do: Repo.get!(Tenure, id)

  @doc """
  Creates a tenure.

  ## Examples

      iex> create_tenure(%{field: value})
      {:ok, %Tenure{}}

      iex> create_tenure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tenure(attrs \\ %{}) do
    %Tenure{}
    |> Tenure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tenure.

  ## Examples

      iex> update_tenure(tenure, %{field: new_value})
      {:ok, %Tenure{}}

      iex> update_tenure(tenure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tenure(%Tenure{} = tenure, attrs) do
    tenure
    |> Tenure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tenure.

  ## Examples

      iex> delete_tenure(tenure)
      {:ok, %Tenure{}}

      iex> delete_tenure(tenure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tenure(%Tenure{} = tenure) do
    Repo.delete(tenure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tenure changes.

  ## Examples

      iex> change_tenure(tenure)
      %Ecto.Changeset{source: %Tenure{}}

  """
  def change_tenure(%Tenure{} = tenure) do
    Tenure.changeset(tenure, %{})
  end
end
