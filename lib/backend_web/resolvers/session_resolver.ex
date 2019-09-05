defmodule BackendWeb.Resolvers.SessionResolver do
  alias Backend.{Accounts, Guardian}

  def login_user(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.Session.auth(input),
    {:ok, token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: token, user: user}}
    end
  end
end
