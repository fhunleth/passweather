#---
# Excerpted from "Build a Weather Station with Elixir and Nerves",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/passweather for more book information.
#---
defmodule WeatherTracker.Repo.Migrations.SetUpWeatherDataTable do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS timescaledb")

    create table(:weather_conditions, primary_key: false) do
      add :timestamp, :naive_datetime, null: false
      add :altitude_m, :decimal, null: false
      add :pressure_pa, :decimal, null: false
      add :temperature_c, :decimal, null: false
      add :co2_eq_ppm, :decimal, null: false
      add :tvoc_ppb, :decimal, null: false
      add :light_lumens, :decimal, null: false
    end

    execute("SELECT create_hypertable('weather_conditions', 'timestamp')")
  end

  def down do
    drop table(:weather_conditions)
    execute("DROP EXTENSION IF EXISTS timescaledb")
  end
end
