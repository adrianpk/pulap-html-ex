defmodule PulapWeb.ResourceController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Resource

  def index(conn, _params) do
    resources = Auth.list_resources()
    render(conn, "index.html", resources: resources)
  end

  def new(conn, _params) do
    changeset = Auth.change_resource(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    case Auth.create_resource(resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource created successfully.")
        |> redirect(to: resource_path(conn, :show, resource))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Auth.get_resource!(id)
    render(conn, "show.html", resource: resource)
  end

  def edit(conn, %{"id" => id}) do
    resource = Auth.get_resource!(id)
    changeset = Auth.change_resource(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Auth.get_resource!(id)

    case Auth.update_resource(resource, resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: resource_path(conn, :show, resource))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Auth.get_resource!(id)
    {:ok, _resource} = Auth.delete_resource(resource)

    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: resource_path(conn, :index))
  end
end
