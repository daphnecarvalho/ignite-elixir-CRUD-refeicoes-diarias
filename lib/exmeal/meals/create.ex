defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Repo, Meal}

  # params = %{calories: 20,date: ~N[2021-12-05 00:02:13], description: "Banana"}
  # Exmeal.Meals.Create.call(params)
  # Exmeal.Repo.all(Exmeal.Meal)
  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
