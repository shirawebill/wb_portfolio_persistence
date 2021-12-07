defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices, primary_key: false) do
      add(:device_id, :uuid, primary_key: true)
      add(:org_id, :uuid, null: false)
      add(:meter_number, :string, null: false)
      add(:description, :string)
      add(:utility_type, :string, null: false)
      add(:prepaid, :boolean, null: false)
      add(:tariff_id, references(:tariffs, column: :tariff_id, type: :uuid), null: false)
      add(:schedule_id, references(:schedules))
      timestamps()
    end

    create(unique_index(:devices, [:device_id, :org_id]))
  end
end
