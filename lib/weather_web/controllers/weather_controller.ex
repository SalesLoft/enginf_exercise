defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  @dark_sky_client Application.get_env(:weather, :dark_sky_client)

  def index(conn, _params) do
    render(conn, "index.json", %{foo: "bar"})
  end

  def weather(conn, params) do
    if params["latitude"] == nil || params["longitude"] == nil do
      conn
      |> put_resp_content_type("text/plain; charset=utf8")
      |> send_resp(400, "Missing latitude or longitude query parameters")
    else
      json(conn, @dark_sky_client.get_forcast(params["latitude"], params["longitude"]))
    end
  end
end

defmodule DarkSkyClient do
  @callback get_forcast(String.t, String.t) :: {:ok, term}
end

defmodule RuntimeDarkSkyClient do
  @behaviour DarkSkyClient

  @impl DarkSkyClient
  def get_forcast(latitude, longitude) do
    url = "https://api.darksky.net/forecast/#{System.fetch_env!("dark_sky_key")}/#{latitude},#{longitude}"
    response = HTTPoison.get!(url)
    Poison.decode!(response.body)
  end
end


defmodule TestDarkSkyClient do
  @behaviour DarkSkyClient

  @impl DarkSkyClient
  def get_forcast(latitude, longitude) do
    "#{longitude}, #{latitude}: Sunny"
  end
end
