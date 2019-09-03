defmodule Weather.Repo do
  use Ecto.Repo,
    otp_app: :weather,
    adapter: Ecto.Adapters.Postgres
end
