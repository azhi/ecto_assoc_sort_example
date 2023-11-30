defmodule EctoAssocSort.Parent do
  use Ecto.Schema

  schema "parents" do
    has_many(:intermediates, EctoAssocSort.Intermediate)
    has_many(:records, through: [:intermediates, :records])
  end
end
