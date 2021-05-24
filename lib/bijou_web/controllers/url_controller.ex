defmodule BijouWeb.UrlController do
  use BijouWeb, :controller
  alias Bijou.Urls

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    {:ok, _ } = Urls.create_short_url(params["url"])

    render(conn, "index.html")
  end
end
