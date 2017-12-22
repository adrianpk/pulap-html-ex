defmodule PulapWeb.DashboardController do
  use PulapWeb, :controller
  alias Pulap.Auth
  alias Pulap.Auth.User
  alias Pulap.Auth.Guardian

  def index(conn, _params) do
    user = conn |> user_from_session
    render(conn, "index.html", user: user)
  end
end
