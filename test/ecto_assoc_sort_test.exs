defmodule EctoAssocSortTest do
  use ExUnit.Case
  doctest EctoAssocSort

  require Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoAssocSort.Repo)
  end

  test "should return nested assocs in correct order" do
    parent = %EctoAssocSort.Parent{} |> EctoAssocSort.Repo.insert!()

    intermediate1 =
      %EctoAssocSort.Intermediate{parent_id: parent.id} |> EctoAssocSort.Repo.insert!()

    intermediate2 =
      %EctoAssocSort.Intermediate{parent_id: parent.id} |> EctoAssocSort.Repo.insert!()

    _record1 =
      %EctoAssocSort.Record{number: 1, intermediate_id: intermediate1.id}
      |> EctoAssocSort.Repo.insert!()

    _record2 =
      %EctoAssocSort.Record{number: 2, intermediate_id: intermediate2.id}
      |> EctoAssocSort.Repo.insert!()

    _record3 =
      %EctoAssocSort.Record{number: 3, intermediate_id: intermediate1.id}
      |> EctoAssocSort.Repo.insert!()

    _record4 =
      %EctoAssocSort.Record{number: 4, intermediate_id: intermediate2.id}
      |> EctoAssocSort.Repo.insert!()

    records_query = Ecto.Query.from(r in EctoAssocSort.Record, order_by: r.number)

    result_numbers =
      parent
      |> EctoAssocSort.Repo.preload(records: records_query)
      |> then(& &1.records)
      |> Enum.map(& &1.number)

    assert result_numbers == [1, 2, 3, 4]
  end
end
