defmodule WB.Portfolio.Persistence.Sites do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_actual_site(attrs) do
    attrs
    |> Site.actual_changeset()
    |> Repo.insert()
  end

  def add_virtual_site(attrs) do
    attrs
    |> Site.virtual_changeset()
    |> Repo.insert()
  end

  def update_site(attrs, site) do
    attrs
    |> Site.virtual_changeset(site)
    |> Repo.update()
  end

  def get_site(site_id), do: Repo.get(Site, site_id)

  def get_sites(org_id) do
    from(s in Site)
    |> filter_query_by_org(org_id)
    |> Repo.all()
  end
end
