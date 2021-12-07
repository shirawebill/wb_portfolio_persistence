defmodule PortfolioBillingTemplateSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "test valid template item" do
    item = get_template_items() |> hd
    assert %Changeset{valid?: true} = BillingTemplateItem.changeset(item)
  end

  test "test invalid template item - nil device number" do
    attrs = Map.update!(get_template_items() |> hd, :device_number, fn _ -> nil end)
    assert %Changeset{valid?: false} = BillingTemplateItem.changeset(attrs)
  end

  # test "valid template changeset" do
  #   attrs =
  #     get_billing_template()
  #     |> Map.update!(:deposits, fn _ -> get_template_items() end)
  #     |> Map.update!(:water, fn _ -> get_template_items() end)
  #     |> Map.update!(:electricity, fn _ -> get_template_items() end)
  #     |> Map.update!(:effluence, fn _ -> get_template_items() end)

  #   assert %Changeset{valid?: true} = BillingTemplate.changeset(attrs)
  # end

  # test "invalid template changeset - empty account_number, empty template items" do
  #   attrs = Map.update!(get_billing_template(), :account_number, fn _ -> nil end)
  #   assert %Changeset{valid?: false} = BillingTemplate.changeset(attrs)
  # end
end
