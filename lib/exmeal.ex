defmodule Exmeal do
  alias Exmeal.Meals.Create, as: CreateMeal
  alias Exmeal.Meals.Delete, as: DeleteMeal
  alias Exmeal.Meals.Get, as: GetMeal
  alias Exmeal.Meals.Update, as: UpdateMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(id), to: DeleteMeal, as: :call
  defdelegate get_all_meals(), to: GetMeal, as: :all
  defdelegate get_meal_by_id(id), to: GetMeal, as: :by_id
  defdelegate update_meal(params), to: UpdateMeal, as: :call
end
