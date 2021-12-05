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
end
