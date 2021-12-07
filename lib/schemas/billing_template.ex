defmodule WB.Portfolio.Persistence.BillingTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id
  @optional_fields [:inserted_at, :updated_at, :billing_template_id]

  schema "billing_templates" do
    field(:description, :string)
    field(:provider, :string)
    field(:account_number, :string, null: false)
    field(:address, :string)
    field(:township, :string)
    field(:erf, :string)
    field(:portion, :string)
    field(:area, :float)
    field(:value, :float)
    field(:refuse_charges, {:array, :string})
    embeds_many(:deposits, WB.Portfolio.Persistence.BillingTemplateItem)
    embeds_many(:water, WB.Portfolio.Persistence.BillingTemplateItem)
    embeds_many(:electricity, WB.Portfolio.Persistence.BillingTemplateItem)
    embeds_many(:effluence, WB.Portfolio.Persistence.BillingTemplateItem)
    timestamps()

    belongs_to(:site, WB.Portfolio.Persistence.Site, references: :site_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, template \\ %__MODULE__{}) do
    template
    |> cast(attrs, [
      :description,
      :provider,
      :account_number,
      :address,
      :township,
      :erf,
      :portion,
      :area,
      :value,
      :refuse_charges
    ])
    |> validate_required([:account_number, :area])
    |> cast_embed(:deposits, with: &cast_items/2)
    |> cast_embed(:water, with: &cast_items/2)
    |> cast_embed(:electricity, with: &cast_items/2)
    |> cast_embed(:effluence, with: &cast_items/2)
    |> validate_required(all_fields() -- @optional_fields)
    |> foreign_key_constraint(:site_id)
  end

  defp cast_items(%{} = item_attribute, attrs) do
    item_attribute
    |> cast(attrs, [:device_number, :charges, :consumptions])
    |> validate_required([:device_number, :charges, :consumptions])
  end
end
