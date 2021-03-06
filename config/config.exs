# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :todo,
  ecto_repos: [Todo.Repo]

# Configures the endpoint
config :todo, Todo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZGgA0MJxfge/sjTZlR3stSVMIITLZaadxLK5jdVRXD5KYA7HUEDUMLkASYvQaoBF",
  render_errors: [view: Todo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Todo",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "<your secret guardian key>",
  serializer: Todo.GuardianSerializer
