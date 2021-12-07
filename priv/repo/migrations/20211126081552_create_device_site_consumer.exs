defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateDeviceSiteConsumer do
  use Ecto.Migration

  def change do
    create table(:site_devices) do
      add(:site_id, references(:sites), null: false)
      add(:device_id, references(:devices, column: :device_id, type: :uuid), null: false)
      # 100%
      add(:percentage, :float, null: false, default: 1)
      timestamps()
    end

    create table(:site_consumers) do
      add(:site_id, references(:sites), null: false)
      add(:consumer_id, references(:consumers, column: :consumer_id, type: :uuid), null: false)
      # 100%
      add(:percentage, :float, null: false, default: 1)
      timestamps()
    end

    create(unique_index(:site_devices, [:site_id, :device_id]))
    create(unique_index(:site_consumers, [:site_id, :consumer_id]))
  end
end
