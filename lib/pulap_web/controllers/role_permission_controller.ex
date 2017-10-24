defmodule PulapWeb.RolePermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.RolePermission

  def index(conn, _params) do
    role_permissions = Auth.list_role_permissions()
    render(conn, "index.html", role_permissions: role_permissions)
  end

  def new(conn, _params) do
    changeset = Auth.change_role_permission(%RolePermission{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role_permission" => role_permission_params}) do
    case Auth.create_role_permission(role_permission_params) do
      {:ok, role_permission} ->
        conn
        |> put_flash(:info, "Role permission created successfully.")
        |> redirect(to: role_permission_path(conn, :show, role_permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    role_permission = Auth.get_role_permission!(id)
    render(conn, "show.html", role_permission: role_permission)
  end

  def edit(conn, %{"id" => id}) do
    role_permission = Auth.get_role_permission!(id)
    changeset = Auth.change_role_permission(role_permission)
    render(conn, "edit.html", role_permission: role_permission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role_permission" => role_permission_params}) do
    role_permission = Auth.get_role_permission!(id)

    case Auth.update_role_permission(role_permission, role_permission_params) do
      {:ok, role_permission} ->
        conn
        |> put_flash(:info, "Role permission updated successfully.")
        |> redirect(to: role_permission_path(conn, :show, role_permission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", role_permission: role_permission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role_permission = Auth.get_role_permission!(id)
    {:ok, _role_permission} = Auth.delete_role_permission(role_permission)

    conn
    |> put_flash(:info, "Role permission deleted successfully.")
    |> redirect(to: role_permission_path(conn, :index))
  end
end
