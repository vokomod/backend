defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :gender, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create index(:users, [:email], unique: true)

  end
end
