defmodule PulapWeb.DashboardController do
  use PulapWeb, :controller
  alias Pulap.Auth
  alias Pulap.Auth.User
  alias Pulap.Auth.Guardian
  require IEx

  def index(conn, _params) do
    user1 = Guardian.Plug.current_resource(conn)

    user = Auth.get_user!(user1.id) |> Repo.preload(:profile)
    render(conn, "index.html", user: user)
  end
end
