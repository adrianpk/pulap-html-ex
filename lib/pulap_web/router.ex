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
    pipe_through [:browser] # Use the default browser stack
    get "/", PageController, :index
    get "/signup", UserController, :signup
    post "/signup", UserController, :signup
    get "/signin", SessionController, :init_signin
    post "/signin", SessionController, :signin
  end

  scope "/", PulapWeb do
    pipe_through [:browser, :auth] # Use the default browser stack
    get "/signout", SessionController, :signout
  #   get "/", PageController, :index
  #   get "/signup", UserController, :signup
  #   post "/signup", UserController, :signup
  #   get "/signin", SessionController, :signin
  #   post "/signin", SessionController, :signin
  end

  scope "/", PulapWeb do
    pipe_through [:browser, :auth, :ensure_auth] # Use the default browser stack
    get "/dashboard", DashboardController, :index
    resources "/users", UserController do
      get "/profile/edit", ProfileController, :edit
      get "/profile", ProfileController, :show
      patch "/profile", ProfileController, :update
      put "/profile", ProfileController, :update
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
    resources "/property-sets", PropertySetController do
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
    resources "/real_estates", RealEstateController do
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
