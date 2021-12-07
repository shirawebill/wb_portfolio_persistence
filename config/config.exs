import Config

config :wb_portfolio_persistence,
  ecto_repos: [WB.Portfolio.Persistence.Repo]

config :wb_portfolio_persistence, WB.Portfolio.Persistence.Repo,
  database: "wb_portfolio",
  username: "shiragolombick",
  password: "password",
  hostname: "localhost",
  port: 5432,
  pool_size: 10,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]

config :wb_portfolio_persistence, WB.Portfolio.Persistence.Repo,
  types: WB.Portfolio.Persistence.PostgresTypes

import_config("#{Mix.env()}.exs")
