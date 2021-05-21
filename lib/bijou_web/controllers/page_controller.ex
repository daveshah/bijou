defmodule BijouWeb.PageController do
  use BijouWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
