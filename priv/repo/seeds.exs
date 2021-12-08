# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Exmeal.Repo.insert!(%Exmeal.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Exmeal.Meal

meal = %Meal{
  description: "Potato Chips",
  calories: 200,
  date: ~N[2021-12-05 03:05:24],
  id: "2423e0d9-9d0d-4883-bce1-4d625cb92c2e"
}

Repo.insert!(meal)
