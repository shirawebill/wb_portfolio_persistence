defmodule PortfolioConsumerSchemaTest do
  use ExUnit.Case
  use PortfolioSchemaSupportTest

  test "valid consumer changeset" do
    attrs = get_consumer()
    assert %Changeset{valid?: true} = Consumer.changeset(attrs)
  end

  test "invalid consumer changeset - name is too short" do
    attrs = Map.update!(get_consumer(), :name, fn _ -> "hi" end)
    assert %Changeset{valid?: false} = Consumer.changeset(attrs)
  end

  test "invalid consumer changeset - no org_id provided" do
    attrs = Map.update!(get_consumer(), :org_id, fn _ -> nil end)
    assert %Changeset{valid?: false} = Consumer.changeset(attrs)
  end

  test "invalid consumer changeset - invalid email check 1" do
    attrs = Map.update!(get_consumer(), :email, fn _ -> "www" end)
    assert %Changeset{valid?: false} = Consumer.changeset(attrs)
  end

  test "invalid consumer changeset - invalid email check 2" do
    attrs = Map.update!(get_consumer(), :email, fn _ -> "www@yahoo" end)
    assert %Changeset{valid?: false} = Consumer.changeset(attrs)
  end

  test "valid consumer changeset - email is nil and is_virtual is false" do
    attrs = Map.update!(get_consumer(), :email, fn _ -> nil end)
    assert %Changeset{valid?: true} = Consumer.changeset(attrs)
  end

  test "invalid consumer changeset - email is nil and is_virtual is true" do
    attrs =
      get_consumer()
      |> Map.update!(:email, fn _ -> nil end)
      |> Map.update!(:is_virtual, fn _ -> true end)

    assert %Changeset{valid?: false} = Consumer.changeset(attrs)
  end
end
