defmodule WB.Portfolio.Persistence.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do

    create table(:portfolios) do
      add :org_id, :uuid, null: false
      add :name, :string, null: false
      add :description, :string
      add :tags, {:array, :string}
      timestamps()
    end

    create unique_index(:portfolios, [:org_id, :name])

  end
end
