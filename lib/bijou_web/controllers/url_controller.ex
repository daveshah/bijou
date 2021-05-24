defmodule BijouWeb.UrlController do
  use BijouWeb, :controller
  alias Bijou.Urls
  alias BijouWeb.Router.Helpers

  def index(conn, _params) do
    render(conn, "index.html", changeset: Bijou.Urls.short_url_changeset())
  end

  @spec create(Plug.Conn.t(), nil | maybe_improper_list | map) :: Plug.Conn.t()
  def create(conn, params) do
    case Urls.create_short_url(params["short_url"]) do
      {:ok, short_url } ->
        urls = %{ short_url: Helpers.url_url(conn, :show, short_url.key),
                  original_url: short_url.original_url }

        render(conn, "index.html", urls: urls, changeset: Bijou.Urls.short_url_changeset())

      {:error, changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def show(conn, params) do
    case Urls.get_short_url_by_key(params["id"]) do
      nil -> render(conn, "index.html")
      %{ original_url: url } -> redirect(conn, external: url)
    end
  end
end
