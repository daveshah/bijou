defmodule Bijou.Fixtures do
  alias Bijou.Repo

  def create_fixture!(module, attrs) do
    module.__struct__
    |> module.changeset(attrs)
    |> Repo.insert!()
  end
end
