defmodule PortfolioSiteConsumerSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid site_consumer changeset" do
    attrs = get_site_consumer()
    assert %Changeset{valid?: true} = SiteConsumer.changeset(attrs)
  end

  test "invalid site_consumer changeset - perc is greater than 1" do
    attrs = Map.update!(get_site_consumer(), :perc, fn _ -> 1.5 end)
    assert %Changeset{valid?: false} = SiteConsumer.changeset(attrs)
  end

  test "invalid site_consumer changeset - perc is less than 0" do
    attrs = Map.update!(get_site_consumer(), :perc, fn _ -> -1 end)
    assert %Changeset{valid?: false} = SiteConsumer.changeset(attrs)
  end
end
