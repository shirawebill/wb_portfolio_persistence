defmodule WB.Portfolio.Persistence.Consumer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:consumer_id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @optional_fields [:inserted_at, :updated_at, :consumer_id, :email]

  schema "consumers" do
    field(:org_id, :binary_id, null: false)
    field(:name, :string, null: false)
    field(:email, :string)
    field(:is_virtual, :boolean, null: false)
    timestamps()
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(attrs, consumer \\ %__MODULE__{}) do
    consumer
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
    |> validate_length(:name, min: 3)
    |> validate_email()
    |> unique_constraint(:email)
    |> validate_is_virtual_contains_email
  end

  defp validate_email(changeset) do
    changeset
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
      message: "must be a valid email address"
    )
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, WB.Portfolio.Persistence.Repo)
    |> unique_constraint(:email)
  end

  defp validate_is_virtual_contains_email(changeset) when is_struct(changeset) do
    is_virtual = get_field(changeset, :is_virtual)
    email = get_field(changeset, :email)

    if is_virtual and !email do
      add_error(changeset, :is_virtual_email_type, "A virtual consumer needs an email address")
    else
      changeset
    end
  end
end
