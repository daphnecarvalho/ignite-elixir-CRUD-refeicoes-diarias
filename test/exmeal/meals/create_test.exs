defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}
  alias Exmeal.Meals.Create

  describe "call/1" do
    # test "when all params are valid, returns the meal" do
    #   params = build(:meal_params)

    #   response = Create.call(params)

    #   assert {:ok,
    #           %Meal{
    #             calories: 20,
    #             date: ~N[2021-12-05 03:05:24],
    #             description: "Banana",
    #             id: _id
    #           }} = response
    # end

  #   test "when there are invalid params, returns an error" do
  #     params = %{
  #       calories: 0,
  #       date: ~D[2001-05-02]
  #     }

  #     response = Exmeal.create_meal(params)

  #     assert {:error,
  #             %Error{
  #               status: :bad_request,
  #               result: changeset
  #             }} = response

  #     assert errors_on(changeset) == ""
  #   end
  end
end
