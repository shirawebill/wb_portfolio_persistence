defmodule WB.Portfolio.Persistence.Repo.Migrations.CreateBillingInvoices do
  use Ecto.Migration

  def change do
    create table(:billing_invoices, primary_key: false) do
      add(:invoice_number, :string, primary_key: true)
      add(:invoice_url, :string)
      add(:invoice_date, :naive_datetime)
      add(:due_date, :naive_datetime)
      add(:total_ex_tax, :float)
      add(:tax, :float)
      add(:total, :float)
      add(:items, :jsonb, null: false, default: "[]")
      add(:billing_template_id, references(:billing_templates), null: false)
      timestamps()
    end
  end
end
