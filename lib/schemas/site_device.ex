defmodule WB.Portfolio.Persistence.SiteDevice do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id
  @optional_fields [:inserted_at, :updated_at, :id]

  schema "site_devices" do
    field(:perc, :float, null: false)
    timestamps()

    belongs_to(:device, WB.Portfolio.Persistence.Device, references: :device_id)
    belongs_to(:site, WB.Portfolio.Persistence.Site, references: :site_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, site_device \\ %__MODULE__{}) do
    site_device
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
    |> validate_number(:perc, greater_than: 0, less_than: 1)
  end
end
