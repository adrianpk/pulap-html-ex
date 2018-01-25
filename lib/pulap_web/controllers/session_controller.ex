defmodule PulapWeb.SessionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.User
  alias Pulap.Auth.Guardian

  def init_signin(conn, _) do
    changeset = Auth.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    message = if maybe_user != nil do
      "Someone is logged in"
    else
      "No one is logged in"
    end
    conn
    |> put_flash(:info, message)
    |> render("index.html", changeset: changeset, action: session_path(conn, :signin), maybe_user: maybe_user)
  end

  def signin(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Auth.authenticate_user(username, password)
    |> signin_reply(conn)
    # |> assign(:current_user, logged_in_user)
    # |> put_flash(:info, "Welcome back!")
    # |> redirect(to: user_path(conn, :show, logged_in_user))
  end

  defp signin_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/signin")
  end

  defp signin_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: dashboard_path(conn, :index))
  end

  def signout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> configure_session(drop: true)
    |> redirect(to: session_path(conn, :signin))
  end

  defp put_user_data_in_session(conn, user) do
    conn
    |> fetch_session
    |> put_session(:current_user, %{id:       user.id,
                                    username: user.username,
                                    roles:    Enum.map(user.roles, &(&1.id))})
  end

end
