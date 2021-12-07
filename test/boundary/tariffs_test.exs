defmodule PortfolioTariffsTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(WB.Portfolio.Persistence.Repo)
  end

  def get_db_tariff_id() do
    {:ok, t} =
      get_tariff()
      |> Tariffs.add_tariff()

    t.tariff_id
  end

  test "add-update-get-all tariffs - db persistence" do
    attrs = get_tariff()
    # insert test
    assert {:ok, %Tariff{} = inserted_tariff} = Tariffs.add_tariff(attrs)

    # get test
    db_tariff = Tariffs.get_tariff(inserted_tariff.tariff_id)

    # update test
    changed_name = "Changed Name"
    tariff_to_update = %{name: changed_name}

    assert {:ok, %Tariff{} = updated_tariff} = Tariffs.update_tariff(tariff_to_update, db_tariff)

    # get many test
    [head | _tail] = Tariffs.get_tariffs(attrs.org_id)

    assert inserted_tariff == db_tariff
    assert updated_tariff.name == changed_name
    assert head == updated_tariff
  end
end
