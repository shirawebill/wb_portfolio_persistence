defmodule WB.Portfolio.Persistence.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type :binary_id
  @max_days_before_deadline 15
  @optional_fields [:inserted_at, :updated_at, :id]

  schema "schedules" do
    field(:name, :string, null: false)
    field(:description, :string)
    field(:frequency, :string, null: false)
    field(:days_before_deadline, :integer, null: false)
    field(:next_deadline, :naive_datetime, null: false)
    field(:next_start, :naive_datetime)
    field(:next_end, :naive_datetime)
    field(:current_cycle, :integer, null: false)
    field(:current_start, :naive_datetime)
    field(:current_end, :naive_datetime)
    field(:org_id, :binary_id, null: false)
    timestamps()

    has_many(:devices, WB.Portfolio.Persistence.Device, foreign_key: :schedule_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, schedule \\ %__MODULE__{}) do
    schedule
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
    |> validate_inclusion(:frequency, [
      "DAILY",
      "WEEKLY",
      "MONTHLY",
      "BI_MONTHLY",
      "QUARTERLY",
      "SEMI_ANNUALLY",
      "ANNUALY"
    ])
    |> validate_number(:days_before_deadline, greater_than: @max_days_before_deadline)
  end
end
