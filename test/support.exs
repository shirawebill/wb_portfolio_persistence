defmodule PortfolioSchemaSupportTest do
  defmacro __using__(_options) do
    quote do
      alias Ecto.Changeset

      alias WB.Portfolio.Persistence.{
        BillingInvoice,
        BillingTemplate,
        BillingTemplateItem,
        BillingTransaction,
        Consumer,
        Device,
        PortfolioSite,
        Portfolio,
        SiteConsumer,
        SiteDevice,
        Site,
        Tariff,
        Schedule,
        Repo
      }

      alias WB.Portfolio.Persistence.{Tariffs, Portfolios, Devices, Sites, Consumers, Schedules}

      import PortfolioSchemaSupportTest, only: :functions
    end
  end

  def get_tariff do
    %{
      # tariff_id: UUID.uuid4(),
      org_id: UUID.uuid4(),
      name: "tariff",
      description: "description"
    }
  end

  def get_device do
    %{
      # device_id: UUID.uuid4(),
      org_id: UUID.uuid4(),
      meter_number: "X453",
      description: "description",
      utility_type: "WATER",
      prepaid: true,
      tariff_id: UUID.uuid4(),
      schedule_id: "1234"
    }
  end

  def get_consumer do
    %{
      consumer_id: UUID.uuid4(),
      org_id: UUID.uuid4(),
      name: "Consumer",
      email: "shira@webill.net",
      is_virtual: false
    }
  end

  def get_site do
    %{
      name: "site",
      org_id: UUID.uuid4(),
      color: "#E06910",
      description: "description",
      address: "147 N Reef Road",
      gps: "latitude:25.7963966, longitude:28.2895707",
      zone: %Geo.Point{coordinates: {30, -90}, srid: 4326},
      tags: ["tag1", "tag2"],
      area: 2192,
      parent_id: UUID.uuid4()
    }
  end

  def get_portfolio do
    %{
      org_id: UUID.uuid4(),
      name: "portfolio",
      description: "description",
      tags: ["tag1", "tag2"]
    }
  end

  def get_site_device do
    %{
      perc: 0.75,
      site_id: UUID.uuid4(),
      device_id: UUID.uuid4()
    }
  end

  def get_site_consumer do
    %{
      perc: 0.75,
      site_id: UUID.uuid4(),
      consumer_id: UUID.uuid4()
    }
  end

  def get_billing_template do
    %{
      description: "template",
      provider: "Eskom",
      account_number: "6738GTK",
      address: "147 N Reef Road",
      township: "Johannesburg",
      erf: "77",
      portion: "192",
      area: 2192,
      value: 89.7,
      deposits: [],
      water: [],
      electricity: [],
      effluence: [],
      refuse_charges: ["charge1", "charge2"],
      site_id: UUID.uuid4()
    }
  end

  def get_billing_transaction do
    %{
      account_number: "6738GTK",
      date: "2021-12-03 07:23:54",
      amount: 67.89,
      type: "WATER",
      billing_template_id: UUID.uuid4()
    }
  end

  def get_billing_invoice do
    %{
      invoice_number: "6738GTK",
      invoice_url: "www.webill.net",
      invoice_date: "2021-12-03 07:23:54",
      due_date: "2021-12-07 07:23:54",
      total_ex_tax: 78.9,
      tax: 0.15,
      total: 99,
      items: [],
      billing_template_id: UUID.uuid4()
    }
  end

  def get_template_items do
    [
      %{
        device_number: "798678",
        charges: ["charge1", "charge2"],
        consumptions: ["consumption1, consumption2"]
      },
      %{
        device_number: "798678",
        charges: ["charge1", "charge2"],
        consumptions: ["consumption1, consumption2"]
      }
    ]
  end

  def get_schedule do
    %{
      name: "S1",
      description: "Desc",
      frequency: "WEEKLY",
      days_before_deadline: 20,
      next_deadline: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      next_start: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      next_end: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      current_cycle: 0,
      current_start: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      current_end: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      org_id: UUID.uuid4()
    }
  end
end
