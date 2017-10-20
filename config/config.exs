# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pulap,
  ecto_repos: [Pulap.Repo],
  migration_primary_key: [id: :uuid, type: :binary_id],
  migration_timestamps: [type: :timestamptz]

# Configures the endpoint
config :pulap, PulapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SbKMbkBoqBnpcvUhFl6hRhocy+MLIZhRn9fOkEXtpWuF6qjpLoayVS/33Rd40lCc",
  render_errors: [view: PulapWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pulap.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
