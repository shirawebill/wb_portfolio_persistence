defmodule WB.Portfolio.Persistence.Schedules do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_schedule(attrs) do
    attrs
    |> Schedule.changeset()
    |> Repo.insert()
  end

  def update_schedule(attrs, schedule) do
    attrs
    |> Schedule.changeset(schedule)
    |> Repo.update()
  end

  def get_schedule(schedule_id), do: Repo.get(Schedule, schedule_id)

  def get_schedules(org_id) do
    from(s in Schedule,
      where: s.org_id == ^org_id
    )
    |> Repo.all()
  end

  # def add_schedule_cycle(attrs) do
  #   attrs
  #   |> Cycle.changeset
  #   |> Repo.insert
  # end
  # def update_schedule_cycle(attrs, cycle) do
  #   attrs
  #   |> Cycle.changeset(cycle)
  #   |> Repo.update
  # end
  # def get_schedule_cycle(cycle_id), do: Repo.get(Cycle, cycle_id)
  # def get_schedule_cycles(schedule_id) do
  #   (from c in Cycle,
  #   where: c.schedule_id == ^schedule_id)
  #   |> Repo.all
  # end

  # def add_templates_to_schedule(schedule_id, template_ids) do

  # end
  # def remove_templates_from_schedule(schedule_id, templates) do

  # end
end
