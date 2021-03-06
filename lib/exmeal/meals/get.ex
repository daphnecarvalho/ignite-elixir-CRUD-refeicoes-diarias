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
      |> gel_all_meals(%{}, 0)

    {:ok, meals}
  end

  defp gel_all_meals([%Meal{} = meal | tail], acc, id_acc) do
    acc = Map.put_new(acc, id_acc, meal)

    id_acc = id_acc + 1
    gel_all_meals(tail, acc, id_acc)
  end

  defp gel_all_meals([], acc, _id_acc), do: acc
end
