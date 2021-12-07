defmodule PortfolioSchedulesTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(WB.Portfolio.Persistence.Repo)
  end

  test "add-remove-update-get-list schedules" do
    attrs = get_schedule()

    assert {:ok, %Schedule{} = inserted_schedule} = Schedules.add_schedule(attrs)

    db_schedule = Schedules.get_schedule(inserted_schedule.id)

    changed_name = "Changed Name"
    updated_attrs = %{name: changed_name}

    assert {:ok, %Schedule{} = updated_schedule} =
             Schedules.update_schedule(updated_attrs, db_schedule)

    [head | _tail] = Schedules.get_schedules(attrs.org_id)

    assert db_schedule == inserted_schedule
    assert updated_schedule.name == changed_name
    assert head == updated_schedule
  end
end
