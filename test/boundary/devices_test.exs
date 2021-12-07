defmodule PortfolioDevicesTest do
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

  def get_db_schedule_id() do
    {:ok, s} =
      get_schedule()
      |> Schedules.add_schedule()

    s.id
  end

  test "add-update-get-all devices - db persistence" do
    tariff_id = get_db_tariff_id()
    schedule_id = get_db_schedule_id()

    attrs =
      get_device()
      |> Map.update!(:tariff_id, fn _ -> tariff_id end)
      |> Map.update!(:schedule_id, fn _ -> schedule_id end)

    assert {:ok, %Device{} = inserted_device} = Devices.add_device(attrs)

    db_device = Devices.get_device(inserted_device.device_id)
    changed_meter_number = "Changed Meter Number"
    device_to_update = %{meter_number: changed_meter_number}
    assert {:ok, %Device{} = updated_device} = Devices.update_device(device_to_update, db_device)
    [head | _tail] = Devices.get_devices(attrs.org_id)

    assert db_device == inserted_device
    assert updated_device.meter_number == changed_meter_number
    assert head == updated_device
  end
end
