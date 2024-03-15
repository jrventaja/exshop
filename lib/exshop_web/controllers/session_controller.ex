defmodule ExShopWeb.SessionController do
  use ExShopWeb, :controller
  alias ExShop.Account.Accounts

  def create(conn, %{"user" => params}) do
    case Accounts.sign_in(params) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Logged in successfully")
        |> redirect(to: ~p"/admin/home", user: user)

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Invalid email or password")
        |> redirect(to: ~p"/admin", changeset: %{})

      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Invalid email or password")
        |> redirect(to: ~p"/admin", changeset: %{})
    end
  end
end
