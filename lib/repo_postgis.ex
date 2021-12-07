defmodule WB.Portfolio.Persistence.RepoPostGIS do
  Postgrex.Types.define(
    WB.Portfolio.Persistence.PostgresTypes,
    [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
    library: Geo
  )
end
