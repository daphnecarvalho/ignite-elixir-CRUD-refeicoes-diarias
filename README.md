# ExMeal - Challenge: CRUD - Daily meals

[![codecov](https://codecov.io/gh/daphnecarvalho/ignite-trilha-elixir-2021-crud-refeicoes-diarias/branch/main/graph/badge.svg?token=J09MH5ZCJU)](https://codecov.io/gh/daphnecarvalho/ignite-trilha-elixir-2021-crud-refeicoes-diarias)

Instructions: [CRUD - Refeições diárias](https://www.notion.so/Desafio-01-CRUD-Refei-es-di-rias-d2911dcc69ee444faea70eec7796546c).

## Base URL
http://localhost:4000/

## Gigalixir URL
https://married-boiling-unicorn.gigalixirapp.com/

## Routes

### /api/meals
* [<span style="color:#663399">GET</span>] / 
  + ExmealWeb.MealsController :index
* [<span style="color:#663399">GET</span>] /:id 
  + ExmealWeb.MealsController :show
* [<span style="color:#79c900">POST</span>] / 
  + ExmealWeb.MealsController :create
* [<span style="color:#ffc000">PATCH</span>] /:id 
  + ExmealWeb.MealsController :update
* [<span style="color:#ff8c00">PUT</span>] /:id 
  + ExmealWeb.MealsController :update
* [<span style="color:#ff0000">DELETE</span>] /:id 
  + ExmealWeb.MealsController :delete
## Tests
Tests: 24 total
## Project commands
### Prepare project
```bash
  # Intall dependencies
  mix deps.get

  # Start PostgreSQL service
  service postgresql start

  # Reset migrations
  mix ecto.reset
  MIX_ENV=test mix ecto.reset 

  # View app routes
  mix phx.routes
```
### Run project
```bash
  # Start Phoenix server
  mix phx.server
```

### Run tests
```bash
  # Intall dependencies
  mix test

  # Check coverage of tests
  mix test --cover
```