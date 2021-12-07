defmodule WB.Portfolio.Persistence.BillingInvoiceItem do
  use Ecto.Schema

  embedded_schema do
    field(:device_number, :string)
    field(:is_estimate, :boolean, null: false)
    field(:start_read_date, :string)
    field(:end_read_date, :string)
    field(:total_ex_tax, :float)
    embeds_many(:consumptions, WB.Portfolio.Persistence.ItemConsumption)
    embeds_many(:charges, WB.Portfolio.Persistence.ItemCharge)
  end
end
