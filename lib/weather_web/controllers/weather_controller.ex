defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{foo: "bar"})
  end
end
