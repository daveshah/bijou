defmodule BijouWeb.UrlControllerTest do
  use BijouWeb.ConnCase
  alias Bijou.Urls
  alias Bijou.Fixtures

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Bijou."
  end

  test "GET /:key", %{conn: conn} do
    Fixtures.create_fixture!(Urls.ShortUrl, %{original_url: "https://www.test.com", key: "TEST1"})

    conn = get(conn, "/TEST1")

    assert redirected_to(conn) == "https://www.test.com"
  end

  describe "POST /" do
    test "posting with a valid url", %{conn: conn} do
      before_short_url_count = Enum.count(Urls.list_short_urls())

      valid_params = %{"short_url" => %{"original_url" => "https://www.test.com"}}
      conn = post(conn, "/", valid_params)
      assert html_response(conn, 200)

      after_short_url_count = Enum.count(Urls.list_short_urls())

      assert after_short_url_count == before_short_url_count + 1
    end
  end
end
