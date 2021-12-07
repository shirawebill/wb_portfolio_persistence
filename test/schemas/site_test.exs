defmodule PortfolioSiteSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid site changeset" do
    attrs = get_site()
    assert %Changeset{valid?: true} = Site.virtual_changeset(attrs)
  end

  test "valid actual site changeset" do
    attrs =
      get_site()
      |> Map.update!(:gps, fn _ -> nil end)
      |> Map.update!(:zone, fn _ -> %Geo.Point{coordinates: {-21.4833, -37.65}, srid: 4326} end)

    assert %Changeset{valid?: true} = Site.actual_changeset(attrs)
  end

  test "invalid actual site changeset - nil gps and zone" do
    attrs =
      get_site()
      |> Map.update!(:gps, fn _ -> nil end)
      |> Map.update!(:zone, fn _ -> nil end)

    assert %Changeset{valid?: false} = Site.actual_changeset(attrs)
  end

  test "invalid site changeset - invalid color" do
    attrs = Map.update!(get_site(), :color, fn _ -> "1ghfdfsdfh" end)
    assert %Changeset{valid?: false} = Site.virtual_changeset(attrs)
  end

  test "valid site changeset - color is nil" do
    attrs = Map.update!(get_site(), :color, fn _ -> nil end)
    assert %Changeset{valid?: true} = Site.virtual_changeset(attrs)
  end

  test "invalid site changeset - org_id is nil" do
    attrs = Map.update!(get_site(), :org_id, fn _ -> nil end)
    assert %Changeset{valid?: false} = Site.virtual_changeset(attrs)
  end
end
