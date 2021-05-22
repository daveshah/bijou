defmodule BijouWeb.PageController do
  use BijouWeb, :controller
  alias Bijou.Urls

  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec create(Plug.Conn.t(), nil | maybe_improper_list | map) :: Plug.Conn.t()
  def create(conn, params) do
    %{short_url: s, errors: e} = Urls.create_short_url(params["url"])

    render(conn, "index.html")
  end
end
