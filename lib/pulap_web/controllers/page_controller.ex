defmodule PulapWeb.PageController do
  use PulapWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
