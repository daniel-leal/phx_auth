defmodule PhxAuthWeb.Router do
  use PhxAuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug PhxAuthWeb.AuthPipeline
  end

  scope "/api", PhxAuthWeb do
    pipe_through :api

    post "/sign-up", UserController, :create
    post "/sign-in", UserController, :sign_in
  end

  scope "/api", PhxAuthWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/profile", UserController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: PhxAuthWeb.Telemetry
    end
  end
end
