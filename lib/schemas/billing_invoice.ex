defmodule WB.Portfolio.Persistence.BillingInvoice do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :string
  @optional_fields [:inserted_at, :updated_at, :billing_invoice_id]

  schema "billing_invoices" do
    field(:invoice_url, :string)
    field(:invoice_date, :naive_datetime)
    field(:due_date, :naive_datetime)
    field(:total_ex_tax, :float)
    field(:tax, :float)
    field(:total, :float)
    embeds_many(:items, WB.Portfolio.Persistence.BillingInvoiceItem)
    timestamps()

    belongs_to(:billing_template, WB.Portfolio.Persistence.BillingTemplate,
      references: :billing_template_id
    )
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, invoice \\ %__MODULE__{}) do
    invoice
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end
