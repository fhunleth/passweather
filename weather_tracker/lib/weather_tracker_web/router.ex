#---
# Excerpted from "Build a Weather Station with Elixir and Nerves",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/passweather for more book information.
#---
defmodule WeatherTrackerWeb.Router do
  use WeatherTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WeatherTrackerWeb do
    pipe_through :api

    post "/weather-conditions", WeatherConditionsController, :create
  end
end
