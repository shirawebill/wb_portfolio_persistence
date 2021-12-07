defmodule WB.Portfolio.Persistence.BoundarySupport do
  import Ecto.Query
  alias WB.Portfolio.Persistence.Repo

  defmacro __using__(_opts) do
    quote do
      import Ecto.Query

      alias WB.Portfolio.Persistence.{
        BillingInvoice,
        BillingTemplate,
        BillingTransaction,
        Consumer,
        Device,
        PortfolioSite,
        Portfolio,
        SiteConsumer,
        SiteDevice,
        Site,
        Tariff,
        Repo,
        Schedule
      }

      import WB.Portfolio.Persistence.BoundarySupport, only: :functions
    end
  end

  def filter_query_by_org(query, org_id) do
    from(q in query,
      where: q.org_id == ^org_id
    )
  end
end
