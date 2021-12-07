defmodule WB.Portfolio.Persistence.Site do
  use Ecto.Schema
  import Ecto.Changeset
  alias Geo.PostGIS.Geometry

  @foreign_key_type :binary_id

  schema "sites" do
    field(:name, :string, null: false)
    field(:org_id, :binary_id, null: false)
    field(:color, :string)
    field(:description, :string)
    field(:address, :string)
    field(:gps, :string)
    field(:zone, Geo.PostGIS.Geometry)
    field(:tags, {:array, :string})
    field(:area, :float)
    timestamps()
    belongs_to(:parent, WB.Portfolio.Persistence.Site, references: :parent_id)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def actual_changeset(attrs, site \\ %__MODULE__{}) do
    site
    |> cast(attrs, all_fields())
    |> validate_required([:name, :org_id])
    |> foreign_key_constraint(:parent_id)
    |> validate_color
    |> validate_contains_gps_or_zone
  end

  def virtual_changeset(attrs, site \\ %__MODULE__{}) do
    site
    |> cast(attrs, all_fields())
    |> validate_required([:name, :org_id])
    |> foreign_key_constraint(:parent_id)
    |> validate_color
  end

  defp validate_color(changeset) when is_struct(changeset) do
    color = get_field(changeset, :color)

    if color do
      regex = ~r/^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/

      case String.match?(color, regex) do
        true -> changeset
        _ -> add_error(changeset, :color, "Only a hexadecimal color can be used")
      end
    else
      changeset
    end
  end

  defp validate_contains_gps_or_zone(changeset) when is_struct(changeset) do
    gps = get_field(changeset, :gps)
    zone = get_field(changeset, :zone)

    if !gps and !zone do
      add_error(changeset, :contains_gps_or_zone, "An actual site needs either a gps or a zone")
    else
      changeset
    end
  end
end
