defmodule WB.Portfolio.Persistence.BillingTemplates do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_template(attrs) do
    attrs
    |> BillingTemplate.changeset()
    |> Repo.insert()
  end

  def update_template(attrs, template) do
    attrs
    |> BillingTemplate.changeset(template)
    |> Repo.update()
  end

  def get_template(template_id), do: Repo.get(BillingTemplate, template_id)

  def get_tempates(site_id) do
    from(t in BillingTemplate,
      where: t.site_id == ^site_id
    )
    |> Repo.all()
  end
end
