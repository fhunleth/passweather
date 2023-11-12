#---
# Excerpted from "Build a Weather Station with Elixir and Nerves",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/passweather for more book information.
#---
# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weather_tracker,
  ecto_repos: [WeatherTracker.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :weather_tracker, WeatherTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+Ki+sLcIL2Toqw7cVyJgpJCB9wIQf0XNat3bqtM0pl/4IExE3BT0J5tiMd+RV08t",
  render_errors: [view: WeatherTrackerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WeatherTracker.PubSub,
  live_view: [signing_salt: "bxSZ2Kmk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
