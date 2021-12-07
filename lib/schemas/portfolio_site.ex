defmodule WB.Portfolio.Persistence.PortfolioSite do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id
  @optional_fields [:inserted_at, :updated_at, :portfolio_site_id]

  schema "portfolio_sites" do
    timestamps()

    belongs_to(:portfolio, WB.Portfolio.Persistence.Portfolio, references: :portfolio_id)
    belongs_to(:site, WB.Portfolio.Persistence.Site, references: :site_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, site \\ %__MODULE__{}) do
    site
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end
