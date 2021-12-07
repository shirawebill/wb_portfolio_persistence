defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateSites do
  use Ecto.Migration

  def change do
    create table(:sites) do
      add(:name, :string, null: false)
      add(:org_id, :uuid, null: false)
      add(:color, :string)
      add(:description, :string)
      add(:address, :string)
      add(:gps, :string)
      add(:zone, :geometry)
      add(:tags, {:array, :string})
      add(:area, :float)
      add(:parent_id, references(:sites))
      timestamps()
    end

    create(unique_index(:sites, [:name, :org_id]))
  end
end
