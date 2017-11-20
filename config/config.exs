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

# Guardian
# Sample secret generators (iex -S mix)
# JOSE.JWS.generate_key(%{"alg" => "ES512"}) |> JOSE.JWK.to_map |> elem(1)
# JOSE.JWK.generate_key({:oct, 16}) |> JOSE.JWK.to_map |> elem(1)
config :pulap, Pulap.Auth.Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Pulap",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  serializer: Pulap.Auth.GuardianSerializer,
  secret_key: %{"k" => "CraP9aMgj4nmu4wxkT5ftQ", "kty" => "oct"}
  # secret_key: %{
  #   "alg" => "ES512",
  #   "crv" => "P-521",
  #   "d" => "AZ8b14U2dIFUEG8t9NLSlVo9sEYTqXuBHusI94PtJlioTriB6hLtQtI6YS9novMLKjZGft1bsSFo4uAH62xyjY_y",
  #   "kty" => "EC",
  #   "use" => "sig",
  #   "x" => "Ac0Aw-lRg_qa9mrxFl5XZCdd7rFgkmAyHnmHBNWLJIRlNS1ixIbzbIhevyknncc3nACks10zsan5Y9qon7wt_PUo",
  #   "y" => "Aae4WpqdPZXqUvHfqLgnheMTkMPIbLlvW1nECcPKyMEH9oGL6WVAYZJDtvr1xJjeCc4g6kHb4LUZb1uj0atjZ7sS"
  # }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
