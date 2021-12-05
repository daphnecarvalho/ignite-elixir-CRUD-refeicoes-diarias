defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Repo, Meal}

  # params = %{"id" => "effaacb8-011e-4bf8-a631-4e0d5ef00b0a", "calories" => 200}
  # Exmeal.Meals.Update.call(params)
  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
