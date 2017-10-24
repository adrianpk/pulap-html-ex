defmodule PulapWeb.ResourcePermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.ResourcePermission

  def index(conn, _params) do
    resource_permissions = Auth.list_resource_permissions()
    render(conn, "index.html", resource_permissions: resource_permissions)
  end

  def new(conn, _params) do
    changeset = Auth.change_resource_permission(%ResourcePermission{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource_permission" => resource_permission_params}) do
    case Auth.create_resource_permission(resource_permission_params) do
      {:ok, resource_permission} ->
        conn
        |> put_flash(:info, "Resource permission created successfully.")
        |> redirect(to: resource_permission_path(conn, :show, resource_permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource_permission = Auth.get_resource_permission!(id)
    render(conn, "show.html", resource_permission: resource_permission)
  end

  def edit(conn, %{"id" => id}) do
    resource_permission = Auth.get_resource_permission!(id)
    changeset = Auth.change_resource_permission(resource_permission)
    render(conn, "edit.html", resource_permission: resource_permission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource_permission" => resource_permission_params}) do
    resource_permission = Auth.get_resource_permission!(id)

    case Auth.update_resource_permission(resource_permission, resource_permission_params) do
      {:ok, resource_permission} ->
        conn
        |> put_flash(:info, "Resource permission updated successfully.")
        |> redirect(to: resource_permission_path(conn, :show, resource_permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource_permission: resource_permission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource_permission = Auth.get_resource_permission!(id)
    {:ok, _resource_permission} = Auth.delete_resource_permission(resource_permission)

    conn
    |> put_flash(:info, "Resource permission deleted successfully.")
    |> redirect(to: resource_permission_path(conn, :index))
  end
end
