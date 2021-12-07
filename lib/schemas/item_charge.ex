defmodule WB.Portfolio.Persistence.ItemCharge do
  use Ecto.Schema

  embedded_schema do
    field(:charge, :string, null: false)
    field(:total, :float, null: false)
  end
end
