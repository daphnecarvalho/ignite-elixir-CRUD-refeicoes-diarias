defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  alias Ecto.Changeset

  alias Exmeal.Meal

  # describe "changeset/1" do
  #   test "when all params are valid, returns a valid changeset" do
  #     params = %{
  #       description: "Batata",
  #       date: ~N[2021-12-05 03:05:24],
  #       calories: "20"
  #     }

  #     response = Meal.changeset(params)

  #     assert %Changeset{
  #              changes: %{
  #                description: "Batata",
  #                date: ~N[2021-12-05 03:05:24],
  #                calories: 20
  #              },
  #              valid?: true
  #            } = response
  #   end
  # end
end
