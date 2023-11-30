parent = %EctoAssocSort.Parent{} |> EctoAssocSort.Repo.insert!()

intermediate1 = %EctoAssocSort.Intermediate{parent_id: parent.id} |> EctoAssocSort.Repo.insert!()
intermediate2 = %EctoAssocSort.Intermediate{parent_id: parent.id} |> EctoAssocSort.Repo.insert!()

record1 = %EctoAssocSort.Record{number: 1, intermediate_id: 1} |> EctoAssocSort.Repo.insert!()
record2 = %EctoAssocSort.Record{number: 2, intermediate_id: 2} |> EctoAssocSort.Repo.insert!()
record3 = %EctoAssocSort.Record{number: 3, intermediate_id: 1} |> EctoAssocSort.Repo.insert!()
record4 = %EctoAssocSort.Record{number: 4, intermediate_id: 2} |> EctoAssocSort.Repo.insert!()
