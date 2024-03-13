defmodule ExShop.Repo do
  use Ecto.Repo,
    otp_app: :exshop,
    adapter: Ecto.Adapters.Postgres
end
