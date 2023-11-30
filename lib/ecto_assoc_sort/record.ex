defmodule EctoAssocSort.Record do
  use Ecto.Schema

  schema "records" do
    field(:number, :integer)
    belongs_to(:intermediate, EctoAssocSort.Intermediate)
  end
end
