defmodule Pulap.Controllers.Helpers do
  alias Pulap.Repo
  alias Pulap.Auth
  alias Pulap.Auth.User
  alias Pulap.Auth.Guardian
 
  def user_from_session(conn) do
    res = Guardian.Plug.current_resource(conn)
    Auth.get_user!(res.id)
  end

  def user_from_session(conn, :include_profile) do
    conn
    |> user_from_session
    |> Repo.preload(:profile)
  end

  def user_from_params(conn) do
    user_id = conn.params["user_id"]
    Repo.get!(User, user_id)
  end

  def profile_from_user(user) do
    query = Ecto.assoc(user, :profile)
    Repo.one(query)
  end
end
