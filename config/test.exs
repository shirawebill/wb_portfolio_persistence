use Mix.Config

config :wb_portfolio_persistence, WB.Portfolio.Persistence.Repo,
  database: "wb_portfolio_test",
  username: "shiragolombick",
  password: "password",
  hostname: "localhost",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]

config :logger, level: :info
