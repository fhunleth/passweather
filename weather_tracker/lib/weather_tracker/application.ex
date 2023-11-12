#---
# Excerpted from "Build a Weather Station with Elixir and Nerves",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/passweather for more book information.
#---
defmodule WeatherTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WeatherTracker.Repo,
      # Start the Telemetry supervisor
      WeatherTrackerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WeatherTracker.PubSub},
      # Start the Endpoint (http/https)
      WeatherTrackerWeb.Endpoint
      # Start a worker by calling: WeatherTracker.Worker.start_link(arg)
      # {WeatherTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WeatherTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WeatherTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
