defmodule PortfolioScheduleSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid schedule" do
    assert %Changeset{valid?: true} = Schedule.changeset(get_schedule())
  end

  test "invalid schedule - days before deadline" do
    schedule = Map.update!(get_schedule(), :days_before_deadline, fn _ -> 3 end)
    assert %Changeset{valid?: false} = Schedule.changeset(schedule)
  end

  test "invalid schedule - nil frequency" do
    schedule = Map.update!(get_schedule(), :frequency, fn _ -> nil end)
    assert %Changeset{valid?: false} = Schedule.changeset(schedule)
  end

  test "invalid schedule - incorrect frequency" do
    schedule = Map.update!(get_schedule(), :frequency, fn _ -> "nil" end)
    assert %Changeset{valid?: false} = Schedule.changeset(schedule)
  end
end
