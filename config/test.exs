use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pulap, PulapWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pulap, Pulap.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pulap_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]
