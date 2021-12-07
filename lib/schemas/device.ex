defmodule WB.Portfolio.Persistence.Device do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:device_id, :binary_id, autogenerate: true}
  @optional_fields [:inserted_at, :updated_at, :description, :device_id]

  schema "devices" do
    field(:org_id, :binary_id, null: false)
    field(:meter_number, :string, null: false)
    field(:description, :string)
    field(:utility_type, :string, null: false)
    field(:prepaid, :boolean, null: false)
    timestamps()

    belongs_to(:tariff, WB.Portfolio.Persistence.Tariff, references: :tariff_id, type: :binary_id)
    belongs_to(:schedule, WB.Portfolio.Persistence.Schedule)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, device \\ %__MODULE__{}) do
    device
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
    |> validate_inclusion(:utility_type, ["ELECTRICITY", "GAS", "WATER", "REFUSE"])
    |> foreign_key_constraint(:tariff_id)
    |> foreign_key_constraint(:schedule_id)
  end
end
