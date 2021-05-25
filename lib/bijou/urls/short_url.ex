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
    |> validate_url_format()
  end

  def new_changeset(short_url, attrs \\ %{}) do
    short_url
    |> cast(attrs, [:original_url])
  end

  defp validate_url_format(changeset) do
    original_url = get_field(changeset, :original_url)
    if is_binary(original_url) do
      case original_url |> String.trim |> URI.parse do
        %{ scheme: nil } ->
          add_error(changeset, :original_url, "Please specify http or https")
        %{ host: nil } ->
          add_error(changeset, :original_url, "Please specify a valid hostname")
        %{ host: "" } ->
          add_error(changeset, :original_url, "Please specify a valid hostname")
        _ ->
          changeset
      end
    else
      changeset
    end
  end
end
