defmodule Bijou.Repo.Migrations.CreateShortUrls do
  use Ecto.Migration

  def change do
    create table(:short_urls) do
      add :original_url, :string
      add :key, :string

      timestamps()
    end

    create unique_index(:short_urls, [:key])
  end
end
