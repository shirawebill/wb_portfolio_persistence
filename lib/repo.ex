defmodule WB.Portfolio.Persistence.Repo do
  use Ecto.Repo,
    otp_app: :wb_portfolio_persistence,
    adapter: Ecto.Adapters.Postgres
end
