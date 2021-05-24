defmodule Bijou.Urls do
  @moduledoc """
  The Urls context.
  """

  import Ecto.Query, warn: false
  alias Bijou.Repo

  alias Bijou.Urls.ShortUrl

  @doc """
  Returns the list of short_urls.

  ## Examples

      iex> list_short_urls()
      [%ShortUrl{}, ...]

  """
  def list_short_urls do
    Repo.all(ShortUrl)
  end

  def short_url_changeset do
    ShortUrl.new_changeset(%Bijou.Urls.ShortUrl{})
  end

  @doc """
  Returns a short_url by key or nil if no key matches.

  ## Examples

      iex> get_short_url_by_key("KEY")
      %ShortUrl{}

  """
  def get_short_url_by_key(key) do
    Repo.get_by(ShortUrl, key: key)
  end

  defmodule SimpleKeyGenerator do
    def make_key(length \\ 6) do
      upper_and_lower = Enum.to_list(?A..?Z) ++ Enum.to_list(?a..?z)
      numeric = Enum.to_list(0..9) |> Enum.map(&to_string/1)

      upper_and_lower ++ numeric
      |> Enum.take_random(length)
      |> to_string()
    end
  end

  @doc """
  Creates a short_url.

  ## Examples

      iex> create_short_url(url)
      {:ok, %ShortUrl{}}
  """
  def create_short_url(%{"original_url" => url}, generator \\ SimpleKeyGenerator) do
    # TODO: Handle key collisions
    %ShortUrl{}
    |> ShortUrl.changeset(%{original_url: url, key: generator.make_key()})
    |> Repo.insert()
  end
end
