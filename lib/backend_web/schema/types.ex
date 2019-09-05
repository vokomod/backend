defmodule BackendWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias BackendWeb.Schema.Types


  import_types(Types.UserType)
  import_types(Types.SessionType)


end
