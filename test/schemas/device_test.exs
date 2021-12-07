defmodule PortfolioDeviceSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid device changeset" do
    attrs = get_device()
    assert %Changeset{valid?: true} = Device.changeset(attrs)
  end

  test "invalid device changeset - wrong utility type" do
    attrs = Map.update!(get_device(), :utility_type, fn _ -> "waters" end)
    assert %Changeset{valid?: false} = Device.changeset(attrs)
  end

  test "invalid device changeset - nil org_id" do
    attrs = Map.update!(get_device(), :org_id, fn _ -> nil end)
    assert %Changeset{valid?: false} = Device.changeset(attrs)
  end
end
