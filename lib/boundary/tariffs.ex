defmodule WB.Portfolio.Persistence.Tariffs do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_tariff(attrs) do
    attrs
    |> Tariff.changeset()
    |> Repo.insert()
  end

  def update_tariff(attrs, level) do
    attrs
    |> Tariff.changeset(level)
    |> Repo.update()
  end

  def get_tariff(tariff_id), do: Repo.get(Tariff, tariff_id)

  def get_tariffs(org_id) do
    from(p in Tariff)
    |> filter_query_by_org(org_id)
    |> Repo.all()
  end
end
