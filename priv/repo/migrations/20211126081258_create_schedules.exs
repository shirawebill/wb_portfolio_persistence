defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add(:name, :string, null: false)
      add(:description, :string)
      add(:frequency, :string, null: false)
      add(:days_before_deadline, :integer, null: false)
      add(:next_deadline, :naive_datetime)
      add(:next_start, :naive_datetime)
      add(:next_end, :naive_datetime)
      add(:current_cycle, :integer, null: false, default: 0)
      add(:current_start, :naive_datetime)
      add(:current_end, :naive_datetime)
      add(:org_id, :uuid, null: false)
      timestamps()
    end
  end
end
