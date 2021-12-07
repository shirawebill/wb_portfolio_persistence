defmodule PortfolioPortfoliosTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(WB.Portfolio.Persistence.Repo)
  end

  def get_db_portfolio_id() do
    {:ok, p} =
      get_portfolio()
      |> Portfolios.add_portfolio()

    p.id
  end

  test "add-update-get-all portfolio - db persistence" do
    attrs = get_portfolio()
    # insert test
    assert {:ok, %Portfolio{} = inserted_portfolio} = Portfolios.add_portfolio(attrs)

    # get test
    db_portfolio = Portfolios.get_portfolio(inserted_portfolio.id)

    # update test
    changed_name = "Changed Name"
    portfolio_to_update = %{name: changed_name}

    assert {:ok, %Portfolio{} = updated_portfolio} =
             Portfolios.update_portfolio(portfolio_to_update, db_portfolio)

    # get many test
    [head | _tail] = Portfolios.get_portfolios(attrs.org_id)

    assert inserted_portfolio == db_portfolio
    assert updated_portfolio.name == changed_name
    assert head == updated_portfolio
  end
end
