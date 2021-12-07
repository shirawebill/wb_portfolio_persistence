defmodule WB.Portfolio.Persistence.ItemConsumption do
  use Ecto.Schema

  embedded_schema do
    field(:index, :string, null: false)
    field(:startReading, :float)
    field(:endReading, :float)
    field(:value, :float, null: false)
  end
end
