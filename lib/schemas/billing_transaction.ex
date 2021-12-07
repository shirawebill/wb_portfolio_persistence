defmodule WB.Portfolio.Persistence.BillingTransaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:account_number, :string, []}
  @foreign_key_type :string
  @optional_fields [:inserted_at, :updated_at, :billing_transaction_id]

  schema "billing_transactions" do
    field(:date, :naive_datetime, null: false)
    field(:ammount, :float, null: false)
    field(:type, :string, null: false)
    timestamps()

    belongs_to(:billing_template, WB.Portfolio.Persistence.BillingTemplate,
      references: :billing_template_id
    )
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, transaction \\ %__MODULE__{}) do
    transaction
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end
