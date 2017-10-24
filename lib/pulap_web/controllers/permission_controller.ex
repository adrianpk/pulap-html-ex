defmodule PulapWeb.PermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Permission

  def index(conn, _params) do
    permissions = Auth.list_permissions()
    render(conn, "index.html", permissions: permissions)
  end

  def new(conn, _params) do
    changeset = Auth.change_permission(%Permission{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"permission" => permission_params}) do
    case Auth.create_permission(permission_params) do
      {:ok, permission} ->
        conn
        |> put_flash(:info, "Permission created successfully.")
        |> redirect(to: permission_path(conn, :show, permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    permission = Auth.get_permission!(id)
    render(conn, "show.html", permission: permission)
  end

  def edit(conn, %{"id" => id}) do
    permission = Auth.get_permission!(id)
    changeset = Auth.change_permission(permission)
    render(conn, "edit.html", permission: permission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "permission" => permission_params}) do
    permission = Auth.get_permission!(id)

    case Auth.update_permission(permission, permission_params) do
      {:ok, permission} ->
        conn
        |> put_flash(:info, "Permission updated successfully.")
        |> redirect(to: permission_path(conn, :show, permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", permission: permission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    permission = Auth.get_permission!(id)
    {:ok, _permission} = Auth.delete_permission(permission)

    conn
    |> put_flash(:info, "Permission deleted successfully.")
    |> redirect(to: permission_path(conn, :index))
  end
end
