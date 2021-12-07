defmodule PortfolioPortfolioSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid portfolio changeset" do
    attrs = get_portfolio()
    assert %Changeset{valid?: true} = Portfolio.changeset(attrs)
  end

  test "invalid portfolio changeset - nil org_id" do
    attrs = Map.update!(get_portfolio(), :org_id, fn _ -> nil end)
    assert %Changeset{valid?: false} = Portfolio.changeset(attrs)
  end
end
