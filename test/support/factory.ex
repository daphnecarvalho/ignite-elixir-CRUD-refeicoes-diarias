defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meal

  def meal_params_factory do
    %{
      "description" => "Potato Chips",
      "calories" => 200,
      "date" => ~N[2021-12-05 03:05:24]
    }
  end

  def meal_factory do
    %Meal{
      description: "Potato Chips",
      calories: 200,
      date: ~N[2021-12-05 03:05:24],
      id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e"
    }
  end
end
