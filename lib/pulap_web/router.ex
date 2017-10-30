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
    resources "/profile", ProfileController do
      # nested resources
    end
    resources "/organizations", OrganizationController do
      # nested resources
    end
    resources "/roles", RoleController do
      # nested resources
    end
    resources "/permissions", PermissionController do
      # nested resources
    end
    resources "/resources", ResourceController do
      # nested resources
    end
    resources "/role-permissions", RolePermissionController do
      # nested resources
    end
    resources "/resource-permissions", ResourcePermissionController do
      # nested resources
    end
    resources "/user-roles", UserRoleController do
      # nested resources
    end
    resources "/properties", PropertyController do
      # nested resources
    end
    resources "/properties-set", PropertiesSetController do
      # nested resources
    end
    resources "/plans", PlanController do
      # nested resources
    end
    resources "/plans-subscriptions", PlanSubscriptionController do
      # nested resources
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PulapWeb do
  #   pipe_through :api
  # end
end
