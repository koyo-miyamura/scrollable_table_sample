defmodule ScrollableTableSample.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ScrollableTableSample.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ScrollableTableSample.Users.create_user()

    user
  end
end
