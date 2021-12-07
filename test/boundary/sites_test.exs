defmodule PortfolioSitesTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(WB.Portfolio.Persistence.Repo)
  end

  def get_db_site_id() do
    {:ok, s} =
      get_site()
      |> Sites.add_actual_site()

    s.id
  end

  test "add-update-get-all site - db persistence" do
    attrs = get_site()
    # insert test
    assert {:ok, %Site{} = inserted_site} = Sites.add_actual_site(attrs)

    # get test
    db_site = Sites.get_site(inserted_site.id)

    # update test
    changed_name = "Changed Name"
    site_to_update = %{name: changed_name}

    assert {:ok, %Site{} = updated_site} = Sites.update_site(site_to_update, db_site)

    # get many test
    [head | _tail] = Sites.get_sites(attrs.org_id)

    assert inserted_site == db_site
    assert updated_site.name == changed_name
    assert head == updated_site
  end
end
