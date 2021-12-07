defmodule WB.Portfolio.Persistence.Devices do
  use WB.Portfolio.Persistence.BoundarySupport

  def add_device(attrs) do
    attrs
    |> Device.changeset()
    |> Repo.insert()
  end

  def update_device(attrs, device) do
    attrs
    |> Device.changeset(device)
    |> Repo.update()
  end

  def get_device(device_id), do: Repo.get(Device, device_id)

  def get_devices(org_id) do
    from(d in Device)
    |> filter_query_by_org(org_id)
    |> Repo.all()
  end
end
