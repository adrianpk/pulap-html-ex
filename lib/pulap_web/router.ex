defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :browser_auth do
  #   plug Guardian.Plug.VerifySession
  #   plug Guardian.Plug.EnsureAuthenticated, handler: Pulap.Token
  #   plug Guardian.Plug.LoadResource
  #   plug PulapWeb.Plugs.AssignGuardianUser
  # end 

  pipeline :auth do
    plug Pulap.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PulapWeb do
    pipe_through [:browser, :auth] # Use the default browser stack
    get "/", PageController, :index
    #resources "/users", UserController, only: [:new, :create]
    get "/signup", UserController, :signup
    post "/signup", UserController, :signup
    resources "/users", UserController do
      # nested resources
    end
    get "/signin", SessionController, :signin
    post "/signin", SessionController, :signin
    get "/signout", SessionController, :signout
    #resources "/sessions", SessionController, only: [:new, :create, :delete]

  end

  scope "/", PulapWeb do
    pipe_through [:browser, :ensure_auth] # Use the default browser stack
    # get "/init-sign-up", UserController, :init_sign_up
    # post "/sign-up", UserController, :sign_up
    # resources "/users", UserController do
    #   # nested resources
    # end
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
    resources "/property-sets", PropertiesSetController do
      # nested resources
    end
    resources "/plans", PlanController do
      # nested resources
    end
    resources "/plan-subscriptions", PlanSubscriptionController do
      # nested resources
    end
    resources "/key-values", KeyValueController do
      # nested resources
    end
    resources "/geo-areas", GeoAreaController do
      # nested resources
    end
    resources "/currencies", CurrencyController do
      # nested resources
    end
    resources "/real-estate", RealEstateController do
      # nested resources
    end
    resources "/tenures", TenureController do
      # nested resources
    end
    resources "/administratorships", AdministratorshipController do
      # nested resources
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PulapWeb do
  #   pipe_through :api
  # end
end
