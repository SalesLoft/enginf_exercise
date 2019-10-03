defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert json_response(conn, 200) == %{"foo" => "bar"}
  end

  test "GET /weather", %{conn: conn} do
    conn = get(conn, "/weather")
    assert text_response(conn, 400) == "Missing latitude or longitude query parameters"
  end

  test "GET /weather?longitude=123", %{conn: conn} do
    conn = get(conn, "/weather?longitude=123")
    assert text_response(conn, 400) == "Missing latitude or longitude query parameters"
  end

  test "GET /weather?latitude=123", %{conn: conn} do
    conn = get(conn, "/weather?latitude=123")
    assert text_response(conn, 400) == "Missing latitude or longitude query parameters"
  end

  test "GET /weather?longitude=123&latitude=123", %{conn: conn} do
    conn = get(conn, "/weather?longitude=123&latitude=123")
    assert json_response(conn, 200) == "123, 123: Sunny"
  end
end
