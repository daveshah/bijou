defmodule Bijou.UrlsTest do
  use Bijou.DataCase

  alias Bijou.Urls
  alias Bijou.Urls.ShortUrl
  alias Bijou.Fixtures

  @valid_url "https://www.test.com"
  @valid_params %{"original_url" => @valid_url}

  describe "create_short_url/1" do
    test "with a valid url" do
      assert {:ok, %ShortUrl{original_url: @valid_url} } =
        Urls.create_short_url(@valid_params)
    end

    test "duplicate urls" do
      {:ok, %ShortUrl{original_url: @valid_url,
                      key: first_key } } =
        Urls.create_short_url(@valid_params)

      {:ok, %ShortUrl{original_url: @valid_url,
                      key: second_key } } =
        Urls.create_short_url(@valid_params)

       assert second_key != first_key
    end
  end

  describe "list_short_urls/0" do
    test "it returns all short urls" do
      Fixtures.create_fixture!(ShortUrl, %{original_url: "https://www.test.com", key: "TEST1"})
      Fixtures.create_fixture!(ShortUrl, %{original_url: "https://www.test.com", key: "TEST2"})

      assert [%ShortUrl{}, %ShortUrl{}] = Urls.list_short_urls()
    end
  end

  describe "get_short_url_by_key/1" do
    test "that it returns a short_url by key" do
      Fixtures.create_fixture!(ShortUrl, %{original_url: "https://www.test.com", key: "TEST1"})

      assert %ShortUrl{ key: "TEST1", original_url: "https://www.test.com" } =
        Urls.get_short_url_by_key("TEST1")
    end

    test "that it returns nil when no key matches" do
      refute Urls.get_short_url_by_key("NO KEY PRESENT")
    end
  end

  describe "short_url_changeset/0" do
    test "that it returns a new changeset" do
      changeset = Urls.short_url_changeset()
      assert %Ecto.Changeset{} = changeset
      assert %ShortUrl{} = changeset.data
    end
  end
end
