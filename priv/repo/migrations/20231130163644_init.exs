defmodule EctoAssocSort.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    create table("parents") do
    end

    create table("intermediates") do
      add(:parent_id, references("parents"), null: false)
    end

    create table("records") do
      add(:number, :integer, null: false)
      add(:intermediate_id, references("intermediates"), null: false)
    end
  end
end
