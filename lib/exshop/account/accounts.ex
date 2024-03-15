defmodule ExShop.Account.Accounts do
  alias ExShop.Account.Models.User
  alias ExShop.Repo

  def sign_in(%{"email" => email, "password" => password}) do
    user = Repo.get_by(User, email: email)

    case user do
      nil ->
        {:error, :not_found}

      _ ->
        case Bcrypt.verify_pass(password, user.password_hash) do
          true -> {:ok, user}
          _ -> {:error, :unauthorized}
        end
    end
  end
end
