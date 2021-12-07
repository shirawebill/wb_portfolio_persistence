defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateTariffs do
  use Ecto.Migration

  def change do
    create table(:tariffs, primary_key: false) do
      add(:tariff_id, :uuid, primary_key: true)
      add(:org_id, :uuid, null: false)
      add(:name, :string, null: false)
      add(:description, :string)
      timestamps()
    end

    create(unique_index(:tariffs, [:tariff_id, :org_id]))
  end
end
