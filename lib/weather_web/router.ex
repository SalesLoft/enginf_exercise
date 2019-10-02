defmodule WeatherWeb.Router do
  use WeatherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeatherWeb do
    pipe_through :browser

    get "/", WeatherController, :index
    get "/weather", WeatherController, :weather
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeatherWeb do
  #   pipe_through :api
  # end
end
