defmodule Exmeal.Meals.DeleteTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}
  alias Exmeal.Meals.{Create, Delete}

  describe "call/1" do
    test "when a valid id is given, returns the meal" do
      params = build(:meal_params)

      {_ok, meal} = Create.call(params)

      response = Delete.call(meal.id)

      assert {:ok,
              %Meal{
                calories: 200,
                date: ~N[2021-12-05 03:05:24],
                description: "Potato Chips",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Delete.call(id)

      assert {:error,
              %Error{
                status: :not_found,
                result: "Meal not found!"
              }} = response
    end
  end
end
