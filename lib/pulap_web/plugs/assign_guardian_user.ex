require IEx

defmodule PulapWeb.Plugs.AssignGuardianUser do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    #assign(conn, :current_user, conn.private.guardian_default_resource)
    current_user = Guardian.Plug.current_resource(conn)
    conn = assign(conn, :current_user, current_user)
    conn
  end
end
