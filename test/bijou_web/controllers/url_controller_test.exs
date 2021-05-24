defmodule BijouWeb.UrlControllerTest do
  use BijouWeb.ConnCase
  alias Bijou.Urls

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Bijou!"
  end

  describe "POST /" do
    test "posting with a valid url", %{conn: conn} do
      before_short_url_count = Enum.count(Urls.list_short_urls())

      conn = post(conn, "/", url: "https://www.google.com")
      assert html_response(conn, 200)

      after_short_url_count = Enum.count(Urls.list_short_urls())

      assert after_short_url_count == before_short_url_count + 1
    end
  end
end
