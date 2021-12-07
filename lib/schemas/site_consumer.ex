defmodule WB.Portfolio.Persistence.SiteConsumer do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id
  @optional_fields [:inserted_at, :updated_at, :id]

  schema "site_consumers" do
    field(:perc, :float, null: false)
    timestamps()

    belongs_to(:site, WB.Portfolio.Persistence.Site, references: :site_id)
    belongs_to(:consumer, WB.Portfolio.Persistence.Consumer, references: :consumer_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, site_consumer \\ %__MODULE__{}) do
    site_consumer
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
    |> validate_number(:perc, greater_than: 0, less_than: 1)
  end
end
