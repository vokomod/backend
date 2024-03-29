defmodule BackendWeb.Resolvers.UserResolver do
  alias Backend.Accounts
  def users(_, _, %{context: context}) do
    IO.puts "------------------------------------"
    IO.inspect(context)
    IO.puts "------------------------------------"
    {:ok, Accounts.list_users}
  end

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
