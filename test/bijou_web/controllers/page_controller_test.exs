defmodule BijouWeb.PageControllerTest do
  use BijouWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Bijou!"
  end

  describe "POST /" do
    test "posting with a valid url", %{conn: conn} do
      before_short_url_count = Enum.count(Bijou.Repo.all(Bijou.ShortUrl))

      conn = post(conn, "/", url: "https://www.google.com")
      assert html_response(conn, 200)

      after_short_url_count = Enum.count(Bijou.Repo.all(Bijou.ShortUrl))

      assert after_short_url_count == before_short_url_count + 1
      # TODO: Could test by querying for www.google.com
    end
  end
end
