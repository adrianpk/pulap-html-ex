defmodule PulapWeb.UserRoleController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.UserRole

  def index(conn, _params) do
    user_roles = Auth.list_user_roles()
    render(conn, "index.html", user_roles: user_roles)
  end

  def new(conn, _params) do
    changeset = Auth.change_user_role(%UserRole{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_role" => user_role_params}) do
    case Auth.create_user_role(user_role_params) do
      {:ok, user_role} ->
        conn
        |> put_flash(:info, "User role created successfully.")
        |> redirect(to: user_role_path(conn, :show, user_role))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_role = Auth.get_user_role!(id)
    render(conn, "show.html", user_role: user_role)
  end

  def edit(conn, %{"id" => id}) do
    user_role = Auth.get_user_role!(id)
    changeset = Auth.change_user_role(user_role)
    render(conn, "edit.html", user_role: user_role, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_role" => user_role_params}) do
    user_role = Auth.get_user_role!(id)

    case Auth.update_user_role(user_role, user_role_params) do
      {:ok, user_role} ->
        conn
        |> put_flash(:info, "User role updated successfully.")
        |> redirect(to: user_role_path(conn, :show, user_role))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_role: user_role, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_role = Auth.get_user_role!(id)
    {:ok, _user_role} = Auth.delete_user_role(user_role)

    conn
    |> put_flash(:info, "User role deleted successfully.")
    |> redirect(to: user_role_path(conn, :index))
  end
end
