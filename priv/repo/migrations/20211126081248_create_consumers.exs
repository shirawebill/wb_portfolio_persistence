defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateConsumers do
  use Ecto.Migration

  def change do
    create table(:consumers, primary_key: false) do
      add(:consumer_id, :uuid, null: false, primary_key: true)
      add(:org_id, :uuid, null: false)
      add(:name, :string, null: false)
      add(:email, :string)
      add(:is_virtual, :boolean, null: false)
      timestamps()
    end

    create(unique_index(:consumers, [:consumer_id, :org_id]))
  end
end
