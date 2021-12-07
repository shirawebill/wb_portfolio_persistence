defmodule WB.Portfolio.Persistence.BillingInvoices do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_invoice(attrs) do
    attrs
    |> BillingInvoice.changeset()
    |> Repo.insert()
  end

  def update_invoice(attrs, invoice) do
    attrs
    |> BillingInvoice.changeset(invoice)
    |> Repo.update()
  end

  def get_invoice(invoice_id), do: Repo.get(BillingInvoice, invoice_id)

  def get_invoices(template_id) do
    from(i in BillingInvoice,
      where: i.billing_template_id == ^template_id
    )
    |> Repo.all()
  end
end
