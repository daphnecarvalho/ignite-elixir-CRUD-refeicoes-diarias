defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :calories, :date]

  @derive {Jason.Encoder, only: [:id, :description, :calories, :date]}

  # %Rockelivery.User{}
  schema "meals" do
    field :description, :string
    field :calories, :integer
    field :date, :naive_datetime

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, max: 255)
    |> validate_length(:calories, greater_than: 0)
  end
end
