defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Repo, Meal}

  # Exmeal.Meals.Get.by_id("effaacb8-011e-4bf8-a631-4e0d5ef00b0a")
  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

  # Exmeal.Meals.Get.all()
  def all() do
    meals =
      Repo.all(Meal)
      |> gel_all_meals(%{})

    {:ok, meals}
  end

  def gel_all_meals([%Meal{id: id} = meal | tail], acc) do
    acc = Map.put_new(acc, id, meal)

    gel_all_meals(tail, acc)
  end

  def gel_all_meals([], acc), do: acc
end
