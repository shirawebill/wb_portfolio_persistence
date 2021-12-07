defmodule PortfolioConsumersTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(WB.Portfolio.Persistence.Repo)
  end

  def get_db_consumer_id() do
    {:ok, c} =
      get_consumer()
      |> Consumers.add_consumer()

    c.consumer_id
  end

  test "add-update-get-all consumers - db persistence" do
    attrs = get_consumer()
    # insert test
    assert {:ok, %Consumer{} = inserted_consumer} = Consumers.add_consumer(attrs)

    # get test
    db_consumer = Consumers.get_consumer(inserted_consumer.consumer_id)

    # update test
    changed_name = "Changed Name"
    consumer_to_update = %{name: changed_name}

    assert {:ok, %Consumer{} = updated_consumer} =
             Consumers.update_consumer(consumer_to_update, db_consumer)

    # get many test
    [head | _tail] = Consumers.get_consumers(attrs.org_id)

    assert inserted_consumer == db_consumer
    assert updated_consumer.name == changed_name
    assert head == updated_consumer
  end
end
