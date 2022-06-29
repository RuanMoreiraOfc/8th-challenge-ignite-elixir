defmodule Exmeal.Error do
  @keys [:result, :status]
  @enforce_keys @keys
  defstruct @keys

  def wrap(reason) do
    {:error, reason}
  end

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found(result) do
    :not_found
    |> build(result)
  end

  def build_bad_request(result) do
    :bad_request
    |> build(result)
  end

  def build_meal_not_found_error do
    "Meal not found"
    |> build_not_found()
  end
end
