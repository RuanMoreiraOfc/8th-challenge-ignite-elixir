defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @displayable_params [
    :description,
    :date,
    :calories
  ]
  @params @displayable_params
  @derive {Jason.Encoder, only: [:id] ++ @displayable_params}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
  end

  def changeset(params) do
    %__MODULE__{}
    |> build_changeset(params, @params)
  end

  def changeset(struct, params) do
    struct
    |> build_changeset(params, @params)
  end

  defp build_changeset(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
  end
end
