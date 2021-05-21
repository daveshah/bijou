defmodule Bijou.Repo do
  use Ecto.Repo,
    otp_app: :bijou,
    adapter: Ecto.Adapters.Postgres
end
