defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateBilingTemplates do
  use Ecto.Migration

  def change do
    create table(:billing_templates) do
      add(:description, :string)
      add(:provider, :string)
      add(:account_number, :string, null: false)
      add(:address, :string)
      add(:township, :string)
      add(:erf, :string)
      add(:portion, :string)
      add(:area, :float)
      add(:value, :float)
      add(:deposits, :jsonb, null: false, default: "[]")
      add(:water, :jsonb, null: false, default: "[]")
      add(:electricity, :jsonb, null: false, default: "[]")
      add(:effluence, :jsonb, null: false, default: "[]")
      add(:refuse_charges, {:array, :string})
      add(:site_id, references(:sites))
      timestamps()
    end

    create(unique_index(:billing_templates, [:account_number]))
  end
end
