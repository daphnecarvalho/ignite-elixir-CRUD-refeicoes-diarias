defmodule ExmealWeb.MealsControllerTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  alias ExmealWeb.MealsController

  describe "create/2" do
    # test "when all params are valid, creates a meal", %{conn: conn} do
    #   params = build(:meal_params)

    #   response =
    #     conn
    #     |> post(Routes.meals_path(conn, :create, params))
    #     |> json_response(:created)

    #   assert %{
    #            "message" => "Meal created!",
    #            "meal" => %{
    #              "description" => "Potato Chips",
    #              "calories" => 200,
    #              "date" => ~N[2021-12-05 03:05:24],
    #              "id" => _id
    #            }
    #          } = response
    # end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"description" => "Banana"}

      expected_response = %{
        "message" => %{
          "calories" => ["can't be blank"],
          "date" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the meal", %{conn: conn} do
      id = "2423e0d9-9d0d-4883-bce1-4d625cb92c2e"
      insert(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found!"} = response
    end
  end

  describe "update/2" do
    test "when id exist, update the meal", %{conn: conn} do
      params = build(:meal_params)

      {:ok, meal} = Exmeal.create_meal(params)

      id = meal.id

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 200,
                 "date" => "2021-12-05T03:05:24",
                 "description" => "Potato Chips",
                 "id" => _id
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found!"} = response
    end
  end

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      params = build(:meal_params)

      {:ok, meal} = Exmeal.create_meal(params)

      id = meal.id

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 200,
                 "date" => "2021-12-05T03:05:24",
                 "description" => "Potato Chips",
                 "id" => _id
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> get(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found!"} = response
    end
  end
end
