defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase

  alias Exmeal.Error

  describe "Get Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calories: 20,
        date: ~N[2021-12-05 03:05:24],
        description: "Banana"
      }

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.get_meal_by_id(meal.id)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~N[2021-12-05 03:05:24],
                description: "Banana",
                id: _id
              }} = response
    end

  #   test "when an invalid id is given, returns an error" do
  #     id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
  #     response = Exmeal.get_meal_by_id(id)

  #     assert {:error, %Error{status: :not_found, result: "Meal not found!"}} = response
  #   end
  end
end
