import Config

config :ecto_assoc_sort, EctoAssocSort.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "ecto_assoc_sort_test"
