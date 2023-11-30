import Config

config :ecto_assoc_sort, ecto_repos: [EctoAssocSort.Repo]

config :ecto_assoc_sort, EctoAssocSort.Repo,
  database: "ecto_assoc_sort",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

if Mix.env() == :test, do: import_config("test.exs")
