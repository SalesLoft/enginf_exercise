defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{foo: "bar"})
  end

  def weather(conn, params) do
    if params["latitude"] == nil || params["longitude"] == nil do
      conn
      |> put_resp_content_type("text/plain; charset=utf8")
      |> send_resp(400, "Missing latitude or longitude query parameters")
    else
      url = "https://api.darksky.net/forecast/#{System.fetch_env!("dark_sky_key")}/#{params["latitude"]},#{params["longitude"]}"
      response = HTTPoison.get!(url)
      json(conn, Poison.decode!(response.body))
    end
  end
end
