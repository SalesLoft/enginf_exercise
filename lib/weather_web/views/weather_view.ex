defmodule WeatherWeb.WeatherView do
  use WeatherWeb, :view

  def render("index.json", %{foo: foo}) do
    %{
      "foo" => foo
    }
  end
end
