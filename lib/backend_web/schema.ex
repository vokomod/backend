defmodule BackendWeb.Schema do
  use Absinthe.Schema
  alias BackendWeb.Resolvers
  alias BackendWeb.Schema.Middleware


  import_types(BackendWeb.Schema.Types)


  query do
    @desc "get list of all users"
    field :users, list_of(:user_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "register new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "login a user and return token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_user/3)
    end
  end
end
