defmodule PortfolioSiteDeviceSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid site_device changeset" do
    attrs = get_site_device()
    assert %Changeset{valid?: true} = SiteDevice.changeset(attrs)
  end

  test "invalid site_device changeset - perc is greater than 1" do
    attrs = Map.update!(get_site_device(), :perc, fn _ -> 1.5 end)
    assert %Changeset{valid?: false} = SiteDevice.changeset(attrs)
  end

  test "invalid site_device changeset - perc is less than 0" do
    attrs = Map.update!(get_site_device(), :perc, fn _ -> -1 end)
    assert %Changeset{valid?: false} = SiteDevice.changeset(attrs)
  end
end
