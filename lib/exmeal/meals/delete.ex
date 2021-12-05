defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Error, Repo, Meal}

  # Exmeal.Meals.Delete.call("15e4c591-2267-4933-a659-20139a473539")
  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
