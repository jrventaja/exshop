defmodule ExShopWeb.AdminController do
  use ExShopWeb, :controller
  alias ExShop.Account.Models.User

  def login(conn, _params) do
    changeset = User.changeset(%{})
    render(conn, :login, changeset: changeset)
  end

  def home(conn, _params) do
    render(conn, :home)
  end
end
