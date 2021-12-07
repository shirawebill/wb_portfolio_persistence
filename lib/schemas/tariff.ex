defmodule WB.Portfolio.Persistence.Tariff do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:tariff_id, :binary_id, autogenerate: true}
  @optional_fields [:inserted_at, :updated_at, :description, :tariff_id]

  schema "tariffs" do
    field(:org_id, :binary_id, null: false)
    field(:name, :string, null: false)
    field(:description, :string)
    timestamps()

    has_many(:devices, WB.Portfolio.Persistence.Device, foreign_key: :tariff_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, tariff \\ %__MODULE__{}) do
    tariff
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end
