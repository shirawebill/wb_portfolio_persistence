defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateBillingTransactions do
  use Ecto.Migration

  def change do
    create table(:billing_transactions, primary_key: false) do
      add(:account_number, :string, primary_key: true)
      add(:date, :naive_datetime, null: false)
      add(:amount, :float, null: false)
      add(:type, :string, null: false)
      add(:billing_template_id, references(:billing_templates), null: false)
      timestamps()
    end
  end
end
