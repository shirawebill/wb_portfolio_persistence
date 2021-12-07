defmodule WB.Portfolio.Persistence.Consumers do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_consumer(attrs) do
    attrs
    |> Consumer.changeset()
    |> Repo.insert()
  end

  def update_consumer(attrs, provider) do
    attrs
    |> Consumer.changeset(provider)
    |> Repo.update()
  end

  def get_consumer(consumer_id), do: Repo.get(Consumer, consumer_id)

  def get_consumers(org_id) do
    from(d in Consumer)
    |> filter_query_by_org(org_id)
    |> Repo.all()
  end
end
