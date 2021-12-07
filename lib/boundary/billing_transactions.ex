defmodule WB.Portfolio.Persistence.BillingTransactions do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_transaction(attrs) do
    attrs
    |> BillingTransaction.changeset()
    |> Repo.insert()
  end

  def update_transaction(attrs, transaction) do
    attrs
    |> BillingTransaction.changeset(transaction)
    |> Repo.update()
  end

  def get_transaction(transaction_id), do: Repo.get(BillingTransaction, transaction_id)

  def get_transactions(template_id) do
    from(t in BillingTransaction,
      where: t.billing_template_id == ^template_id
    )
    |> Repo.all()
  end
end
