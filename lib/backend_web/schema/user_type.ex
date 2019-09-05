defmodule BackendWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:age, :integer)
    field(:gender, :string)
  end

  input_object :user_input_type do
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:age, non_null(:integer))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:gender, non_null(:string))
  end
end
