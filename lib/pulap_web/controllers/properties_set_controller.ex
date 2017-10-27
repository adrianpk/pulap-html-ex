defmodule PulapWeb.PropertiesSetController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.PropertiesSet

  def index(conn, _params) do
    properties_sets = App.list_properties_sets()
    render(conn, "index.html", properties_sets: properties_sets)
  end

  def new(conn, _params) do
    changeset = App.change_properties_set(%PropertiesSet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"properties_set" => properties_set_params}) do
    case App.create_properties_set(properties_set_params) do
      {:ok, properties_set} ->
        conn
        |> put_flash(:info, "Properties set created successfully.")
        |> redirect(to: properties_set_path(conn, :show, properties_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    properties_set = App.get_properties_set!(id)
    render(conn, "show.html", properties_set: properties_set)
  end

  def edit(conn, %{"id" => id}) do
    properties_set = App.get_properties_set!(id)
    changeset = App.change_properties_set(properties_set)
    render(conn, "edit.html", properties_set: properties_set, changeset: changeset)
  end

  def update(conn, %{"id" => id, "properties_set" => properties_set_params}) do
    properties_set = App.get_properties_set!(id)

    case App.update_properties_set(properties_set, properties_set_params) do
      {:ok, properties_set} ->
        conn
        |> put_flash(:info, "Properties set updated successfully.")
        |> redirect(to: properties_set_path(conn, :show, properties_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", properties_set: properties_set, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    properties_set = App.get_properties_set!(id)
    {:ok, _properties_set} = App.delete_properties_set(properties_set)

    conn
    |> put_flash(:info, "Properties set deleted successfully.")
    |> redirect(to: properties_set_path(conn, :index))
  end
end
