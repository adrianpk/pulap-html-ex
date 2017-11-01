defmodule PulapWeb.GeoAreaController do
  use PulapWeb, :controller

  alias Pulap.Geo
  alias Pulap.Geo.GeoArea

  def index(conn, _params) do
    geo_areas = Geo.list_geo_areas()
    render(conn, "index.html", geo_areas: geo_areas)
  end

  def new(conn, _params) do
    changeset = Geo.change_geo_area(%GeoArea{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"geo_area" => geo_area_params}) do
    case Geo.create_geo_area(geo_area_params) do
      {:ok, geo_area} ->
        conn
        |> put_flash(:info, "Geo area created successfully.")
        |> redirect(to: geo_area_path(conn, :show, geo_area))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    geo_area = Geo.get_geo_area!(id)
    render(conn, "show.html", geo_area: geo_area)
  end

  def edit(conn, %{"id" => id}) do
    geo_area = Geo.get_geo_area!(id)
    changeset = Geo.change_geo_area(geo_area)
    render(conn, "edit.html", geo_area: geo_area, changeset: changeset)
  end

  def update(conn, %{"id" => id, "geo_area" => geo_area_params}) do
    geo_area = Geo.get_geo_area!(id)

    case Geo.update_geo_area(geo_area, geo_area_params) do
      {:ok, geo_area} ->
        conn
        |> put_flash(:info, "Geo area updated successfully.")
        |> redirect(to: geo_area_path(conn, :show, geo_area))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", geo_area: geo_area, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    geo_area = Geo.get_geo_area!(id)
    {:ok, _geo_area} = Geo.delete_geo_area(geo_area)

    conn
    |> put_flash(:info, "Geo area deleted successfully.")
    |> redirect(to: geo_area_path(conn, :index))
  end
end
