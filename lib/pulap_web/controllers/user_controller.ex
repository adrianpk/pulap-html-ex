defmodule PulapWeb.UserController do

  #use Guardian, otp_app: :pulap
  use PulapWeb, :controller
  alias Pulap.Auth
  alias Pulap.Auth.User
  alias Pulap.Auth.Guardian
  require IEx

  def index(conn, _params) do
    users = Auth.list_users()
    render(conn, "index.html", users: users)
  end

  def signup(%{method: "GET"} = conn, params) do
    changeset = Auth.change_user(%User{})
    render(conn, "signup.html", changeset: changeset)
  end

  def signup(%{method: "POST"} = conn, %{"user" => user_params}) do
    case Auth.sign_up_user(user_params) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "User signed up successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "signup.html", changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    changeset = Auth.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Auth.get_user!(id)

    case Auth.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    {:ok, _user} = Auth.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end

  # defp authorize_user(conn, _) do
  #   conn
  # end

  # defp authorize_admin(conn, _) do
  #   conn
  # end

  # defp authorize_user2(conn, _) do
  #   user = conn |> fetch_session |> get_session(:current_user)
  #   user2 = conn.assigns[:current_user]
  #   ##IEx.pry
  #   if user && (Integer.to_string(user.id) == conn.params["id"] || Pulap.RoleChecker.is_superadmin?(user)) do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "You are not authorized to modify that user!")
  #     |> redirect(to: page_path(conn, :index))
  #     |> halt()
  #   end
  # end

  # defp authorize_admin2(conn, _) do
  #   user = conn |> fetch_session |> get_session(:current_user)
  #   ##IEx.pry
  #   if user && Pulap.RoleChecker.is_superadmin?(user) do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "You are not authorized to create new users!")
  #     |> redirect(to: page_path(conn, :index))
  #     |> halt()
  #   end
  # end

  defp user_roles(user) do
    assoc(user, :roles)
  end

  defp user_preload_assoc(changeset) do
    changeset
    |> Repo.preload(:roles)
  end
end
