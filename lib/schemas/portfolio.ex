defmodule WB.Portfolio.Persistence.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id

  schema "portfolios" do
    field(:org_id, :binary_id, null: false)
    field(:name, :string, null: false)
    field(:description, :string)
    field(:tags, {:array, :string})
    timestamps()
    has_many(:sites, WB.Portfolio.Persistence.Site)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, portfolio \\ %__MODULE__{}) do
    portfolio
    |> cast(attrs, [:org_id, :name])
    |> validate_required([:org_id, :name])
  end
end
