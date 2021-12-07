defmodule WB.Portfolio.Persistence.Portfolios do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_portfolio(attrs) do
    attrs
    |> Portfolio.changeset()
    |> Repo.insert()
  end

  def update_portfolio(attrs, portfolio) do
    attrs
    |> Portfolio.changeset(portfolio)
    |> Repo.update()
  end

  def get_portfolio(portfolio_id), do: Repo.get(Portfolio, portfolio_id)

  def get_portfolios(org_id) do
    from(p in Portfolio)
    |> filter_query_by_org(org_id)
    |> Repo.all()
  end
end
