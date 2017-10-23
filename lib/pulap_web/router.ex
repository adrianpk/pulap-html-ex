defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PulapWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController do
      # nested resources
    end
    resources "/organizations", OrganizationController do
      # nested resources
    end
    resources "/roles", RoleController do
      # nested resources
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PulapWeb do
  #   pipe_through :api
  # end
end
