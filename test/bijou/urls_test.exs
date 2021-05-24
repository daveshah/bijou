defmodule Bijou.UrlsTest do
  use Bijou.DataCase

  alias Bijou.Urls
  alias Bijou.Urls.ShortUrl

  def create_fixture(attrs) do
    %ShortUrl{}
    |> ShortUrl.changeset(attrs)
    |> Repo.insert()
  end

  describe "create_short_url/1" do
    test "with a valid url" do
      assert {:ok, %ShortUrl{original_url: "https://www.google.com"} } =
        Urls.create_short_url("https://www.google.com")
    end

    test "duplicate urls" do
      {:ok, %ShortUrl{original_url: "https://www.google.com",
                      key: first_key } } =
        Urls.create_short_url("https://www.google.com")

      {:ok, %ShortUrl{original_url: "https://www.google.com",
                      key: second_key } } =
        Urls.create_short_url("https://www.google.com")

       assert second_key != first_key
    end
  end

  describe "list_short_urls/0" do
    test "it returns all short urls" do
      create_fixture(%{original_url: "https://www.test.com", key: "TEST1"})
      create_fixture(%{original_url: "https://www.test.com", key: "TEST2"})

      assert [%ShortUrl{}, %ShortUrl{}] = Urls.list_short_urls()
    end
  end
end
