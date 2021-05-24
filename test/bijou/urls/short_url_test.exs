defmodule Bijou.Urls.ShortUrlTest do
  use Bijou.DataCase
  alias Bijou.Urls.ShortUrl

  @valid_attrs %{original_url: "https://www.google.com", key: "TEST1" }

  describe "changeset/2" do
    test "valid attributes" do
      valid_attrs = %{original_url: "https://www.google.com", key: "TEST1" }

      changeset = ShortUrl.changeset(%ShortUrl{}, valid_attrs)

      assert changeset.valid?
    end

    test "invalid URLs" do
      invalid_attrs = %{original_url: "www.google.com", key: "TEST1" }

      changeset = ShortUrl.changeset(%ShortUrl{}, invalid_attrs)

      refute changeset.valid?

      invalid_attrs = %{original_url: "test", key: "TEST1" }

      changeset = ShortUrl.changeset(%ShortUrl{}, invalid_attrs)

      refute changeset.valid?
    end
  end
end
