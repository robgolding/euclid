# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :euclid,
  ecto_repos: [Euclid.Repo]

# Configures the endpoint
config :euclid, Euclid.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/l3NDzRU886vxkGyZAClsdb7BV6/3E6aPvS+r0O5pVEJGNi2T5phpNwLE8lJxCFq",
  render_errors: [view: Euclid.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Euclid.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Eulid.#{Mix.env}",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "test",
  serializer: Euclid.Auth.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
