defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory
  import Phoenix.View

  alias Exmeal.Meal
  alias ExmealWeb.MealsView

  test "render create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 200,
               date: ~N[2021-12-05 03:05:24],
               description: "Potato Chips",
               id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e",
               inserted_at: nil,
               updated_at: nil
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 200,
               date: ~N[2021-12-05 03:05:24],
               description: "Potato Chips",
               id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e",
               inserted_at: nil,
               updated_at: nil
             }
           } = response
  end

  test "render index.json" do
    meals = build_list(2, :meal)

    response = render(MealsView, "index.json", meals: meals)

    assert %{
             meals: [
               %Meal{
                 calories: 200,
                 date: ~N[2021-12-05 03:05:24],
                 description: "Potato Chips",
                 id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e",
                 inserted_at: nil,
                 updated_at: nil
               },
               %Meal{
                 calories: 200,
                 date: ~N[2021-12-05 03:05:24],
                 description: "Potato Chips",
                 id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e",
                 inserted_at: nil,
                 updated_at: nil
               }
             ]
           } = response
  end
end
