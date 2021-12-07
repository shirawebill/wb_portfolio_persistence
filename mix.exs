defmodule WB.Portfolio.Persistence.MixProject do
  use Mix.Project

  def project do
    [
      app: :wb_portfolio_persistence,
      version: "0.1.0",
      build_path: "../../_build",
      # config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {WB.Portfolio.Persistence.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0-rc.1"},
      {:postgrex, ">= 0.0.0"},
      {:uuid, "~> 1.1"},
      {:geo_postgis, "~> 3.4"},
      {:gettext, "~> 0.13"},
      {:csv, "~> 1.2.4"},
      {:geo, "~> 3.4.2"},
      {:cowboy, "~> 2.9.0"}
    ]
  end

  def aliases do
    [
      # setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.load": ["run priv/repo/seeds.exs"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
