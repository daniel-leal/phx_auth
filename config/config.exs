# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_auth,
  ecto_repos: [PhxAuth.Repo]

# Guardian
config :phx_auth, PhxAuth.Guardian,
  issuer: "phx_auth",
  secret_key: "WEL3JrthxjNJZ2/reUl81wxIWbUePwgPQljfQT09WsB5qTksNWF60YJcivb9qy3l"

# serializer: MyApp.GuardianSerializer

# Configures the endpoint
config :phx_auth, PhxAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HXvVpKF9nOodytOW6aOYDFbSb8pmJyL0awJowIlp9dX0LBbK3PNcc5RxzeWA6cgl",
  render_errors: [view: PhxAuthWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhxAuth.PubSub,
  live_view: [signing_salt: "xJiFybS+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
