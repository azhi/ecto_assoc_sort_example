defmodule EctoAssocSort.Intermediate do
  use Ecto.Schema

  schema "intermediates" do
    belongs_to(:parent, EctoAssocSort.Parent)
    has_many(:records, EctoAssocSort.Record)
  end
end
