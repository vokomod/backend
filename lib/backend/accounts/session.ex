defmodule Backend.Accounts.Session do
  alias Backend.Accounts.User
  alias Backend.Repo

  def auth(args) do
    user = Repo.get_by(User, email: args.email)

    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "incorrect login/password"}
    end
  end

    defp check_password(user, args) do
      case user do
        nil -> Comeonin.Argon2.dummy_checkpw()
        _ -> Comeonin.Argon2.checkpw(args.password, user.password_hash)
      end

  end
end
