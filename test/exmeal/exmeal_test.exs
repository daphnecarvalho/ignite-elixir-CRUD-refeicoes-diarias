defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset
  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Potato Chips",
                 date: ~N[2021-12-05 03:05:24],
                 calories: 200
               },
               valid?: true
             } = response
    end
  end

  describe "get_all_meals/0" do
    test "returns all melas" do
      params = build(:meal_params)

      Exmeal.create_meal(params)

      response = Exmeal.get_all_meals()

      assert {:ok,
              %{
                0 => %Meal{
                  calories: 200,
                  date: ~N[2021-12-05 03:05:24],
                  description: "Potato Chips",
                  id: _id
                }
              }} = response
    end
  end
end
