defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :calories, :integer
      add :date, :naive_datetime

      # inserted_at e updated_at
      timestamps()
    end
  end
end
