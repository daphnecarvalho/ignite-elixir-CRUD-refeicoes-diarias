defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}
  alias Exmeal.Meals.{Create, Get}

  describe "by_id/1" do
    test "when a valid id is given, returns the meal" do
      params = build(:meal_params)

      {_ok, meal} = Create.call(params)

      response = Get.by_id(meal.id)

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
      response = Get.by_id(id)

      assert {:error,
              %Error{
                status: :not_found,
                result: "Meal not found!"
              }} = response
    end
  end

  describe "all/0" do
    test "returns all meals" do
      params = build(:meal_params)

      {_ok, meal} = Create.call(params)

      {_ok, response} = Get.all()

      assert %Meal{
               calories: 200,
               date: ~N[2021-12-05 03:05:24],
               description: "Potato Chips",
               id: _id
             } = Map.get(response, meal.id)
    end
  end
end
