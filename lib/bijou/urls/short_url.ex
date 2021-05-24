defmodule Bijou.Urls.ShortUrl do
  use Ecto.Schema
  import Ecto.Changeset

  schema "short_urls" do
    field :original_url, :string
    field :key, :string

    timestamps()
  end

  @doc false
  def changeset(short_url, attrs) do
    short_url
    |> cast(attrs, [:original_url, :key])
    |> validate_required([:original_url, :key])
    |> unique_constraint(:key)
  end
end
