defmodule PortfolioTariffSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid tariff changeset" do
    attrs = get_tariff()
    assert %Changeset{valid?: true} = Tariff.changeset(attrs)
  end

  test "invalid tariff changeset - nil org_id" do
    attrs = Map.update!(get_tariff(), :org_id, fn _ -> nil end)
    assert %Changeset{valid?: false} = Tariff.changeset(attrs)
  end
end
