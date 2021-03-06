defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      %Meal{} = meal ->
        {:ok, meal}

      nil ->
        Error.build_meal_not_found_error()
        |> Error.wrap()
    end
  end
end
