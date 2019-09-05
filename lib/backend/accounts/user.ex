defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :email, :string, unique: true
    field :first_name, :string
    field :gender, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :first_name, :last_name, :gender,
      :age, :email, :password])
    |> validate_required([
      :first_name, :last_name, :gender,
      :age, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 12)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp hash_password(changeset) do
    changeset
  end
end
