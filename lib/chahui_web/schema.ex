defmodule ChahuiWeb.Schema do
  use Absinthe.Schema
  import_types ChahuiWeb.Schema.Types
  alias ChahuiWeb.{Session, MemberResolver}

  query do
    field :members, list_of(:member) do
      resolve &MemberResolver.all_members/3
    end
  end

  mutation do
    field :register, :session do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      arg :password_confirmation, non_null(:string)
      middleware &Session.get_context/2
      resolve &MemberResolver.register/3
    end

    field :login, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      middleware &Session.get_context/2
      resolve &MemberResolver.login/3
    end
  end

end
