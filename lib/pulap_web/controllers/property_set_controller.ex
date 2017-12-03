defmodule PulapWeb.PropertySetController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.PropertySet

  def index(conn, _params) do
    property_sets = App.list_property_sets()
    render(conn, "index.html", property_sets: property_sets)
  end

  def new(conn, _params) do
    changeset = App.change_property_set(%PropertySet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"property_set" => property_set_params}) do
    case App.create_property_set(property_set_params) do
      {:ok, property_set} ->
        conn
        |> put_flash(:info, "Property set created successfully.")
        |> redirect(to: property_set_path(conn, :show, property_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    property_set = App.get_property_set!(id)
    render(conn, "show.html", property_set: property_set)
  end

  def edit(conn, %{"id" => id}) do
    property_set = App.get_property_set!(id)
    changeset = App.change_property_set(property_set)
    render(conn, "edit.html", property_set: property_set, changeset: changeset)
  end

  def update(conn, %{"id" => id, "property_set" => property_set_params}) do
    property_set = App.get_property_set!(id)

    case App.update_property_set(property_set, property_set_params) do
      {:ok, property_set} ->
        conn
        |> put_flash(:info, "Property set updated successfully.")
        |> redirect(to: property_set_path(conn, :show, property_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", property_set: property_set, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    property_set = App.get_property_set!(id)
    {:ok, _property_set} = App.delete_property_set(property_set)

    conn
    |> put_flash(:info, "Property set deleted successfully.")
    |> redirect(to: property_set_path(conn, :index))
  end
end
