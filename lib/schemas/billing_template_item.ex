defmodule WB.Portfolio.Persistence.BillingTemplateItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  embedded_schema do
    # field(:id, :integer, null: false)
    field(:device_number, :string, null: false)
    field(:charges, {:array, :string}, null: false)
    field(:consumptions, {:array, :string}, null: false)
    # belongs_to(:tariff, WB.Portfolio.Persistence.Tariff, references: :tariff_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, all_fields())
    |> validate_required(all_fields())
  end
end
