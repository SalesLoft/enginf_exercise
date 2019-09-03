defmodule Weather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    unless Application.get_env(:weather, :env) == :prod  do
      Envy.auto_load
    end

    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      # Weather.Repo,
      # Start the endpoint when the application starts
      WeatherWeb.Endpoint
      # Starts a worker by calling: Weather.Worker.start_link(arg)
      # {Weather.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Weather.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WeatherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
