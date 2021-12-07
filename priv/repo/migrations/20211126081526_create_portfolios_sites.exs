defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateProfilesSites do
  use Ecto.Migration

  def change do

    create table(:portfolios_sites) do
      add :portfolio_id, references(:portfolios), null: false
      add :site_id, references(:sites), null: false
      timestamps()
    end

    create unique_index(:portfolios_sites, [:portfolio_id, :site_id])

  end
end
