# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ScrollableTableSample.Repo.insert!(%ScrollableTableSample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for i <- 1..100, do: %{name: "name_#{i}"} |> ScrollableTableSample.Users.create_user()
