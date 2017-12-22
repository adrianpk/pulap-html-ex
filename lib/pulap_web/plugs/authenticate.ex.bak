require IEx

defmodule PulapWeb.Plugs.Authenticate do
  #import Plug.Conn
  use PulapWeb, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn
  end

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user, :access)
  end

  def login_by_username_and_pass(conn, username, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(Pulap.Auth.User, username: username)
           |> Repo.preload([:roles])
    cond do
      user && checkpw(given_pass, user.password_hash) ->
        conn
        #|> put_user_data_in_session(user)
        #|> configure_session(renew: true)
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

end
