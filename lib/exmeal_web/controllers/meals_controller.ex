defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal
  alias ExmealWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      connection
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %Meal{}} <- Exmeal.delete_meal(id) do
      connection
      |> put_status(:no_content)
      |> text("")
    end
  end

  def index(connection, _params) do
    with {:ok, meals} <- Exmeal.get_all_meals() do
      connection
      |> put_status(:ok)
      |> render("index.json", meals: meals)
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def update(connection, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.update_meal(params) do
      connection
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end
end
